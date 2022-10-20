extends Control

export  var hp = 15 setget set_hp
export  var Max_hp = 15 
export  var totalkill = 0 
export  var defense = 0
export  var attack = 4
export  var exptogive = 30
export (float) var soulstogive = 1.0


signal died

func set_hp(new_hp):
	hp = new_hp
	if hp <= 0:
		emit_signal("died")
		pass

func _process(delta):
	$Enemypanel/GridContainer/atklb.text = "ATK:" + str(attack)
	$Enemypanel/GridContainer/deflb.text = "DEF:" + str(defense)
	$Enemypanel/GridContainer/exlb.text = " EXP:" + str(exptogive)
	$Enemypanel/GridContainer/totalkill.text = "Total Kill:" + str(totalkill)
	$Enemypanel/GridContainer/soulslb.text = "Souls:" + str(soulstogive)
	$Enemypanel/GridContainer/hblb.text = "HP:" + str(hp)
	pass

