<?php
	session_start();
	include "../config/config.php";
	include "Encoding.php";

	use \ForceUTF8\Encoding;

	$conn = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,BINGO_DB);
	$content = file_get_contents('php://input');
	$content = json_decode($content);
	$request = mysqli_real_escape_string($conn,$content->{'request'});
	$category = mysqli_real_escape_string($conn,$content->{'category'});
	$rows = mysqli_real_escape_string($conn,$content->{'rows'});
	$cols = mysqli_real_escape_string($conn,$content->{'cols'});
	$labels = mysqli_real_escape_string($conn,$content->{'labels'});
	$cards = $content->{'cards'};
	$pool = $content->{'pool'};
	$email = $content->email;
	$hash = mysqli_real_escape_string($conn,$content->{'hash'});
	$result = new stdClass();


	switch($request)
	{
		case "save":
			save($category,$rows,$cols,$cards,$pool,$labels,$hash);
			//generateFile($hash);
		break;
		case "generateFile":
			generateFile($hash);
		default:
	}

	$result->complete = true;
	print json_encode($result);

	function save($category,$rows,$cols,$cards,$pool,$labels,$hash)
	{
		global $conn;
		global $email;
		$pool = Encoding::toUTF8($pool);
		$encodedPool =  json_encode($pool); //stripslashes(json_encode($pool));
		$query = "INSERT INTO games (userhash,category,`cols`,`rows`,labels,config) VALUES (?,?,?,?,?,?)";
		$stmt = $conn->prepare($query);
		$stmt->bind_param('ssiiss',$hash,$category,$cols,$rows,$labels,$encodedPool);
		$stmt->execute();
		$id = $conn->insert_id;
		$stmt->close();

		foreach($cards as $card)
		{
			$query = "INSERT INTO cards (gameID,config) VALUES (?,?)";
			$stmt = $conn->prepare($query);
			$card = Encoding::toUTF8($card);
			$encoded = json_encode($card);
			$stmt->bind_param('is',$id,$encoded);
			$stmt->execute();
			$stmt->close();
		}

		if($email)
		{
			$query = "INSERT INTO registrations (email,gameid) VALUES (?,?)";
			$stmt = $conn->prepare($query);
			$stmt->bind_param('si',$email,$id);
			$stmt->execute();
			$stmt->close();
		}
	}

	function generateFile($hash)
	{
		global $conn;
		global $result;

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

		set_time_limit(0);

		$url = "http://".$_SERVER['SERVER_NAME']."/callers.generator.php?userhash=$hash";
		$output = ".tmp/$hash/bingo/bingo-caller-cards.pdf";
		shell_exec("phantomjs php/scripts/caller.js '$url' $output A4");
		
		for($i = 1; $i <= $count; $i++)
		{
			set_time_limit(0);
			$url = "http://".$_SERVER['SERVER_NAME']."/generator.php?userhash=$hash&card=$i";
			$output = ".tmp/$hash/bingo/bingo-card-$i.pdf";
			shell_exec("phantomjs php/scripts/bingo.js '$url' $output");
		}
		chdir(".tmp/$hash");
		shell_exec("zip -r bingo.zip bingo");
		shell_exec("mv bingo.zip ../../images/users/$hash/bingo/bingo.zip");
		chdir("../../");
		shell_exec("rm -rf .tmp/$hash");
		$result->url = "images/users/$hash/bingo/bingo.zip";
	}

?>
