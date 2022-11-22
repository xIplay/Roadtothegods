extends Control

var template_inv_slot = preload("res://inventory/inv1.tscn")
onready var gridcontainer = $Weapons/VBoxContainer/GridContainer

func _ready():
	for i in Player.inv_data.keys():
		var inv_slot_new = template_inv_slot.instance()
		if Player.inv_data[i]["Item"] != null:
			var item_name = Globalvar.item_data[str(Player.inv_data[i]["Item"])]["Name"]
			var icon_texture = load("res://weapons/" + item_name + ".png")
			inv_slot_new.get_node("icon").set_texture(icon_texture)
		gridcontainer.add_child(inv_slot_new, true)
