<?php 

include "php/config/config.php";
$conn = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,BINGO_DB);
if($_GET['passcode'] != "11Cookies") return;

		$query = "SELECT email,created FROM registrations";
		$stmt = $conn->prepare($query);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($email,$created);
		
		$registrations = array();
		
		while ($stmt->fetch())
		{
			$reg = new stdClass();
			$reg->email = $email;
			$reg->created = $created;
			$registrations[] = $reg;
		}

		$stmt->close();

?>
<!DOCTYPE html>
<html>
	<title>Bingo Report</title>
	<style>

		ul {width: 80%; margin: 0px auto; box-sizing:border-box; list-style: none; padding: 0; border: solid 1px black}
		li.row {box-sizing:border-box; overflow: auto;}
		p {box-sizing:border-box; width: 50%; float: left; padding: 2%; font-family: sans-serif;}
		li.row:nth-child(even) {background-color: #eee;}
		li.row.header {background-color: black; color: white;}
	</style>
	<ul class="container">
		<li class="header row">
			<p>Email</p>
			<p>Registered on</p>
		</li>
		<?php 
			foreach ($registrations as $reg) {
				$email = $reg->email;
				$created = $reg->created;
				print "<li class='row'><p>$email</p><p>$created</p></li>";
			}

		?>
	</ul>
</html>