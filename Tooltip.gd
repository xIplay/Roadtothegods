extends Popup

var origin = ""
var slot = ""
var valid = false

func _ready():
	var item_id 
	if origin == "Inventory":
		if Player.inv_data[slot]["Item"] != null:
			item_id = str(Player.inv_data[slot]["Item"])
			valid = true
	else:
		if Player.equipment_data[slot] != null:
			item_id = str(Player.equipment_data[slot])
			valid= true
	
	if valid:
		get_node("p/M/V/ItemName").set_text(Globalvar.item_data[item_id]["Name"])
		var item_stat = 1
		for i in range(Globalvar.item_stats.size()):
			var stat_name = Globalvar.item_stats[i]
			var stat_label = Globalvar.item_stat_labels[i]
			if Globalvar.item_data[item_id][stat_name] != null:
				var stat_value = Globalvar.item_data[item_id][stat_name]
				get_node("p/M/V/stat" + str(item_stat) + "/stat").set_text(stat_label + ": " + str(stat_value))
				
				
				
				if Globalvar.item_data[item_id]["EquipmentSlot"] != null and origin == "Inventory":
					var stat_difference = CompareItems(item_id, stat_name, stat_value)
					get_node("p/M/V/stat" + str(item_stat) + "/difference").set_text("   " + str(stat_difference))
					if stat_difference > 0:
						get_node("p/M/V/stat" + str(item_stat) + "/difference").set_text("   +" + str(stat_difference))
					elif stat_difference < 0:
						get_node("p/M/V/stat" + str(item_stat) + "/difference").set_text("   -" + str(stat_difference))
					elif stat_difference == 0:
						get_node("p/M/V/stat" + str(item_stat) + "/difference").hide()
				
				item_stat += 1
	
func CompareItems(item_id, stat_name, stat_value):
	var stat_difference
	var equipment_slot = Globalvar.item_data[item_id]["EquipmentSlot"]
	if Player.equipment_data[equipment_slot] != null:
		var item_id_current = Player.equipment_data[equipment_slot]
		var stat_value_current = Globalvar.item_data[str(item_id_current)][stat_name]
		stat_difference = stat_value - stat_value_current
	else:
		stat_difference = stat_value
	return stat_difference
	
	

