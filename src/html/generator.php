<!DOCTYPE html>
<html>
	<title>Sample Bingo Card</title>
	<div id="generation-template">
		
		<?php
		include "php/config/config.php";
		$conn = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,BINGO_DB);
		
		$hash = $_GET['userhash'];
		$index = (int)$_GET['card'] - 1;

		$query = "SELECT g.category, g.cols, g.rows, g.labels, c.config  FROM games g LEFT JOIN cards c on g.id = c.gameID WHERE g.userhash = ? LIMIT $index,1";
		$stmt = $conn->prepare($query);
		$stmt->bind_param('s',$hash);
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($category,$cols,$rows,$labels,$config);
		
		$cards = array();
		
		while ($stmt->fetch()) 
		{
			$card = new stdClass();
			$card->rows = (int) $rows;
			$card->cols = (int) $cols;
			$card->label = $category;
			$card->useLabels = $labels == "true";
			$card->config = json_decode($config);
			$cards[] = $card;
		}
			
		$stmt->close();
		
		$info = $cards[0];
		$rows = $info->rows;
		$cols = $info->cols;
		$game = $info->label;
		$list = $info->config;
		$useLabels = $info->useLabels;

		mysqli_close($conn);
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
				$labelClass = $useLabels ? 'show':'hide';
				print "<span class=\"card\"><img src=\"$src\" alt=\"$label\"><span class=\"label $labelClass\">$label</span></span>";
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
	span.label {display:block; box-sizing:border-box; padding-top:5px; width: 100%; height:30px; background:rgba(255,255,255,0.9); color:black; text-align:center; font-family:sans-serif;}
	span.label.hide {display:none;}

	div.cards span.card {display:block; position:absolute; top:0px; left:0px;}
	div.cards span.card img {display:block; width: 100%;}
	
	div.cards.row-5.col-5 span.card { width: 260px;}
	div.cards.row-4.col-4 span.card { width: 280px;}
	div.cards.row-3.col-3 span.card { width: 400px;}
	div.cards.row-2.col-2 span.card { width: 600px;}
	div.cards.row-1.col-1 span.card { width: 1300px;}
	
	div.cards.col-5 span.card:nth-child(5n+1){left:13px;}
	div.cards.col-5 span.card:nth-child(5n+2){left:315px;}
	div.cards.col-5 span.card:nth-child(5n+3){left:617px;}
	div.cards.col-5 span.card:nth-child(5n+4){left:921px;}
	div.cards.col-5 span.card:nth-child(5n+5){left:1225px;}
	
	div.cards.row-5 span.card:nth-child(n){top:58px;}
	div.cards.row-5 span.card:nth-child(n+6){top:387px;}
	div.cards.row-5 span.card:nth-child(n+11){top:728px;}
	div.cards.row-5 span.card:nth-child(n+16){top:1063px;}
	div.cards.row-5 span.card:nth-child(n+21){top:1396px;}
	
	
	div.cards.col-4 span.card:nth-child(4n+1){left:43px;}
	div.cards.col-4 span.card:nth-child(4n+2){left:421px;}
	div.cards.col-4 span.card:nth-child(4n+3){left:801px;}
	div.cards.col-4 span.card:nth-child(4n+4){left:1181px;}
	
	div.cards.row-4 span.card:nth-child(n){top:90px;}
	div.cards.row-4 span.card:nth-child(n+5){top:517px;}
	div.cards.row-4 span.card:nth-child(n+9){top:938px;}
	div.cards.row-4 span.card:nth-child(n+13){top:1353px;}
	
	div.cards.col-3 span.card:nth-child(3n+1){left:43px;}
	div.cards.col-3 span.card:nth-child(3n+2){left:551px;}
	div.cards.col-3 span.card:nth-child(3n+3){left:1061px;}

	
	div.cards.row-3 span.card:nth-child(n){top:90px;}
	div.cards.row-3 span.card:nth-child(n+4){top:677px;}
	div.cards.row-3 span.card:nth-child(n+7){top:1228px;}
	
	div.cards.col-2 span.card:nth-child(2n+1){left:73px;}
	div.cards.col-2 span.card:nth-child(2n+2){left:831px;}

	div.cards.row-2 span.card:nth-child(n){top:200px;}
	div.cards.row-2 span.card:nth-child(n+3){top:1000px;}

	div.cards.col-1 span.card:nth-child(1n+1){left:94px;}

	div.cards.row-1 span.card:nth-child(n){top:343px;}
	
	<?php 
	
	for($i = 1; $i <= 25; $i++)
	{
		$deg = rand(-5,5) . "deg";
		print "div.cards span.card:nth-child($i) {-webkit-transform: rotate($deg); transform: rotate($deg);}";
	}
	
	?>
	
	</style>
</html>