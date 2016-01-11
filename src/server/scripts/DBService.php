<?php
	session_start();
	include "../config/config.php";

	$conn = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,BINGO_DB);
	$content = file_get_contents('php://input');
	$content = json_decode($content);
	$request = mysqli_real_escape_string($conn,$content->{'request'});
	$category = mysqli_real_escape_string($conn,$content->{'category'});
	$rows = mysqli_real_escape_string($conn,$content->{'rows'});
	$cols = mysqli_real_escape_string($conn,$content->{'cols'});
	$cards = $content->{'cards'};
	$hash = mysqli_real_escape_string($conn,$content->{'hash'});
	$result = new stdClass();


	switch($request)
	{
		case "save":
			save($category,$rows,$cols,$cards,$hash);
			generateFile($hash);
		break;
		case "generateFile":
			generateFile($hash);
		default:
	}

	$result->complete = true;
	print json_encode($result);

	function save($category,$rows,$cols,$cards,$hash)
	{
		global $conn;
		$query = "INSERT INTO games (userhash,category,`cols`,`rows`) VALUES (?,?,?,?)";
		$stmt = $conn->prepare($query);
		$stmt->bind_param('ssii',$hash,$category,$cols,$rows);
		$stmt->execute();
		$id = $conn->insert_id;
		$stmt->close();

		foreach($cards as $card)
		{
			$query = "INSERT INTO cards (gameID,config) VALUES (?,?)";
			$stmt = $conn->prepare($query);
			$encoded = stripslashes(json_encode($card));
			$stmt->bind_param('is',$id,$encoded);
			$stmt->execute();
			$stmt->close();
		}
	}

	function generateFile($hash)
	{
		global $conn;
		global $result;

		error_log("generating files: $hash");

		$query = "SELECT COUNT(*) as numCards FROM games g LEFT JOIN cards c ON g.id = c.gameID WHERE g.userhash = ?";
		$stmt = $conn->prepare($query);
		$stmt->bind_param('s',$hash);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($numCards);
		$count = 0;
		while ($stmt->fetch()) 
		{
			$count = $numCards;
		}
		$stmt->close();
		mysqli_close($conn);

		chdir("../../");
		
		shell_exec("mkdir .tmp/$hash");
		shell_exec("mkdir -p images/users/$hash/bingo");
		
		for($i = 1; $i <= $count; $i++)
		{
			set_time_limit(0);
			$url = "http://".$_SERVER['SERVER_NAME']."/generator.php?userhash=$hash&card=$i";
			$output = ".tmp/$hash/bingo/bingo-card-$i.pdf";
			shell_exec("phantomjs php/scripts/bingo.js '$url' $output");

			error_log("file creation complete: $output");
		}
		error_log("preparing to change dir");
		chdir(".tmp/$hash");

		error_log("zipping");
		shell_exec("zip -r bingo.zip bingo");

		error_log("moving");
		shell_exec("mv bingo.zip ../../images/users/$hash/bingo/bingo.zip");

		error_log("changing directory");
		chdir("../../");

		error_log("removing temp file");
		shell_exec("rm -rf .tmp/$hash");
		$result->url = "images/users/$hash/bingo/bingo.zip";
	}

?>
