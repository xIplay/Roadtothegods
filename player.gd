extends Node

signal ondeath
signal levelup


var max_hp = 15
var hp = 15 setget set_hp
var defense = 2
var servant_amount = 0
var souls = 1
var attack = 2
export (float) var regen = 0.1
Var attack_bonus = 1
Var defense_bonus = 1
Var soulbonus = souls * 0.01
Var exp_bonus = 1


func set_hp(newhp):
	hp = newhp
	if hp <= 0:
		hp = 0
		emit_signal("ondeath")



func on_soul_gain(attack):
	var soulbonus = souls * 2
	var damage = attack + soulbonus
	pass






# LEVELING SYSTEM
export (int) var level = 1
var experience = 0
var experience_total = 0
var experience_required = get_required_experience(level + 1)

func get_required_experience(level):
	return round(pow(level, 1.8) + level * 4)


func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_required:
		experience -= experience_required
		level_up()


func level_up():
	level += 1
	experience_required = get_required_experience(level + 1)
	
	print("levelup")
	pass


func soul_gain(amount):
	souls += amount
	pass


func _process(delta):
	$Servantcounter/Label.text = str(round(servant_amount))
	$Attackcounter/Label.text = str(round(attack))
	$Playerguipanel/basicinfocontainer/Hpexpbar/experiencebar/experiencerequiere.text = str(round(experience_required - experience))
	$Defensecounter/Label.text = str(round(defense))
	$Playerguipanel/basicinfocontainer/NaneLevel/numberlevel.text = str(round(level))
	$Playerguipanel/basicinfocontainer/Hpexpbar/healthbar.value = hp
	$Playerguipanel/basicinfocontainer/Hpexpbar/healthbar.max_value = max_hp
	$Playerguipanel/basicinfocontainer/Hpexpbar/healthbar/hp.text = "%d/%d" % [hp , max_hp]
	$Playerguipanel/basicinfocontainer/Hpexpbar/experiencebar.value = experience
	$Playerguipanel/basicinfocontainer/Hpexpbar/experiencebar.max_value = experience_required
	$Soulscounter/Label.text = str(souls)
	pass

func _on_Timer_timeout():
	if hp < max_hp:
		hp += regen
	print(attack)
	souls += 1

	pass # Replace with function body.


