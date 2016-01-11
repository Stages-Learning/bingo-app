<!DOCTYPE html>
<html>
	<title>Sample Bingo Card</title>
	<div id="generation-template">
		
		<?php
		include "php/config/config.php";
		$conn = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,BINGO_DB);
		
		$hash = $_GET['userhash'];
		$index = (int)$_GET['card'] - 1;

		$query = "SELECT g.category, g.cols, g.rows, c.config  FROM games g LEFT JOIN cards c on g.id = c.gameID WHERE g.userhash = ? LIMIT $index,1";
		$stmt = $conn->prepare($query);
		$stmt->bind_param('s',$hash);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($category,$cols,$rows,$config);
		
		$cards = array();
		
		while ($stmt->fetch()) 
		{
			$card = new stdClass();
			$card->rows = (int) $rows;
			$card->cols = (int) $cols;
			$card->label = $category;
			$card->config = json_decode($config);
			$cards[] = $card;
		}
			
		$stmt->close();
		
		$info = $cards[0];
		$rows = $info->rows;
		$cols = $info->cols;
		$game = $info->label;
		$list = $info->config;
		
		?>
		
		<img id="bg" src="templates/bingo-card-template-<?php print $rows?>x<?php print $cols;?>.png">
		<img id="label-top" src="labels/<?php print $game; ?>-label.png">
		<img id="label-bottom" src="labels/<?php print $game; ?>-label.png">
		
		<div class="cards row-<?php print $rows; ?> col-<?php print $cols; ?>">
			<?php
			foreach($list as $card)
			{
				$src = $card->src;
				$label = $card->label;
				print "<img class=\"card\" src=\"$src\" alt=\"$label\">";
			}
			?>
			
		</div>
		
		
	</div>
	<style>
	html,div,img {margin:0px; padding:0px;}
	div#generation-template {position:relative; width: 1725px;}
	img#bg {display:block; width: 1725px;}
	img#label-top {display:block; position:absolute;top: 400px; left: 610px;}
	img#label-bottom {display:block; position:absolute; top: 2360px; left: 720px;}
	
	div.cards 
	{
		position:absolute;
		top: 711px;
		left: 109px;
		width: 1502px;
		height: 1648px;		
	}
	div.cards img {display:block; position:absolute; top:0px; left:0px;}
	div.cards.row-5.col-5 img.card
	{
		top:0px;
		left:0px;
		width: 260px;
	}
	
	div.cards.col-5 img.card:nth-child(5n+1){left:13px;}
	div.cards.col-5 img.card:nth-child(5n+2){left:315px;}
	div.cards.col-5 img.card:nth-child(5n+3){left:617px;}
	div.cards.col-5 img.card:nth-child(5n+4){left:921px;}
	div.cards.col-5 img.card:nth-child(5n+5){left:1225px;}
	
	div.cards.row-5 img.card:nth-child(n){top:58px;}
	div.cards.row-5 img.card:nth-child(n+6){top:387px;}
	div.cards.row-5 img.card:nth-child(n+11){top:728px;}
	div.cards.row-5 img.card:nth-child(n+16){top:1063px;}
	div.cards.row-5 img.card:nth-child(n+21){top:1396px;}
	
	<?php 
	
	for($i = 1; $i <= 25; $i++)
	{
		$deg = rand(-5,5) . "deg";
		print "div.cards.row-5 img.card:nth-child($i) {-webkit-transform: rotate($deg); transform: rotate($deg);}";
	}
	
	?>
	
	</style>
</html>