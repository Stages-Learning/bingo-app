<?php
	session_start();
	include "../config/config.php";

	$conn = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DB);
	$content = file_get_contents('php://input');
	$content = json_decode($content);
	$request = mysqli_real_escape_string($conn,$content->{'request'});
	$data = new stdClass();
	
	switch($request)
	{
		case "listing":
			listImages();
		break;
		default:
	}

	print json_encode($data);

	function listImages()
	{
		global $conn;
		global $data;

		$data->cards = array();

		$query = "SELECT cards.id, cards.label AS `cardLabel`, cards.path, packs.label AS `packLabel`,packs.free FROM cards 
					LEFT JOIN games_cards ON cards.id = games_cards.card
					LEFT JOIN cards_packs ON cards.id = cards_packs.card
					LEFT JOIN packs ON packs.id = cards_packs.pack
					WHERE games_cards.game = 1";
					
		$stmt = $conn->prepare($query);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($id,$cardLabel,$path,$packLabel,$free);

		while ($stmt->fetch()) 
		{
			$resource = new stdClass();
			$resource->id = $id;
			$resource->label = $cardLabel;
			$resource->path = $path;
			$resource->pack = $packLabel;
			$resource->free = $free == "true";
			$data->cards[] = $resource;
		}

		$stmt->close();
	}
?>