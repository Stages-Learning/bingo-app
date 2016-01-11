module.exports = {
	dev:{
		src:['src/server/config/config.php'],
		dest:["<%= local.staging %>/php/config/config.php"],
		replacements:[
			{
				from:'%DB_SERVER%',
				to:"<%= local.database.host %>"
			},
			{
				from:'%DB_USERNAME%',
				to:"<%= local.database.username %>"
			},
			{
				from:'%DB_PASSWORD%',
				to:"<%= local.database.password %>"
			},
			{
				from:'%DB%',
				to:"<%= local.database.name %>"
			},
			{
				from:'%BINGO_DB%',
				to:"<%= local.database.bingoName %>"
			},
			{
				from:'%ENVI%',
				to:"dev"
			}
			
		]
	},
	deploy:{
		src:['src/server/config/config.php'],
		dest:["<%= local.deploy %>/php/config/config.php"],
		replacements:[
			{
				from:'%DB_SERVER%',
				to:"<%= local.database.host %>"
			},
			{
				from:'%DB_USERNAME%',
				to:"<%= local.database.username %>"
			},
			{
				from:'%DB_PASSWORD%',
				to:"<%= local.database.password %>"
			},
			{
				from:'%DB%',
				to:"<%= local.database.name %>"
			},
			{
				from:'%ENVI%',
				to:"deploy"
			}
			
		]
	}
}