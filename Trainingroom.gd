extends Control
onready var dummy = $Dummy
onready var player = $player

func _on_Mansion_pressed():
	get_tree().change_scene("res://Mainscene.tscn")
	pass # Replace with function body.


func _on_Dummy_died():
	dummy.hp = dummy.Max_hp
	player.gain_experience(dummy.exptogive)
	player.soul_gain(100)
	pass # Replace with function body.


func _on_CheckBox_pressed():
	pass



func _on_dummyButton_pressed():
	if player.attack <= dummy.defense:
		null
	elif player.attack > dummy.defense:
		dummy.hp = round(int(dummy.hp - (player.attack - dummy.defense)))
	print(player.attack)
	pass


func _on_Timer_timeout():
	var servantattack = player.attack
	if $Dummy/Enemypanel/CheckBox.pressed:
		dummy.hp -= round(servantattack)
	else:
		null
	pass
