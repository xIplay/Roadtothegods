extends Control
var missiondone = 0
var achievementcompleted = 0
var challengescompleted = 0
var godkills = 0
var guardiankill = 0
var monsterkill = 0
var dummykill = 0
#Minerals------------------------------------------
var stones = 0
#----------------------------------------------
var item_data = {}
var item_stats = ["Attack", "Defense"]
var item_stat_labels = ["Attack", "Defense"]
func _ready():
	var item_data_file = File.new()
	item_data_file.open("res://Grid Based Inventory/ItemData - Sheet1.json", File.READ)
	var item_data_json = JSON.parse(item_data_file.get_as_text())
	item_data_file.close()
	item_data = item_data_json.result
