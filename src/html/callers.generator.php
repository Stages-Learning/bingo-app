<!DOCTYPE html>
<html>
	<title>Sample Bingo Card</title>
	<div id="generation-template">
		
		<?php
		include "php/config/config.php";
		$conn = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,BINGO_DB);
		
		$hash = $_GET['userhash'];

		$query = "SELECT g.labels, g.config FROM games g WHERE g.userhash = ? LIMIT 1";
		$stmt = $conn->prepare($query);
		$stmt->bind_param('s',$hash);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($labels,$config);
		
		$cards = array();
		$useLabels;
		
		while ($stmt->fetch()) 
		{
			$cards = json_decode($config);
			$useLabels = $labels == "true";
		}
			
		$stmt->close();
		mysqli_close($conn);

		$count = 0;

		foreach ($cards as $card) {
			$label = $card->label;
			$src = $card->src;
			$labelClass = $useLabels ? "show" : "hide";
			if($count == 0) print "<div class='page'>";
			print "<span class='card'><img src='$src'><span class='label $labelClass'>$label</span></span>";
			$count ++;
			if($count == 33)
			{
				$count = 0;
				print "</div>";
			}
		}

		if($count != 0) 
		{
			print "</div>";
		}

		?>
		
		
		
	</div>
	<style>
		html,div,img {margin:0px; padding:0px;}
		div#generation-template {position:relative;}
		div.page
		{
			page-break-after: always;
		}
		div.page:last-child
		{
			page-break-after: avoid;
		}
		
		div#generation-template {position:relative;}
		span.card 
		{
			position: relative;
			display: inline-block;
			width: 30%;
			margin-top: 10px;
			margin-left:1%;
			margin-right: 1%;
			padding: 2%;
			box-sizing:border-box;
			border: dashed 1px black;
		}

		span.card img 
		{
			display: block;
			width: 25%;
			float:left;
		}

		span.card .label 
		{
			display: block;
			float:left;
			height: 30px;
			color:black;
			background-color: white;
			text-align: center;
			box-sizing:border-box;
			padding-top: 5px;
			padding-left: 10px;
			font-size: 12px;
			font-family: sans-serif;
		}
		
	</style>
</html>