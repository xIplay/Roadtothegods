extends Node


signal ondeath
signal levelup
#servants
var servantattackbonus = 0.5
var servantattack = 1
var servant_amount = 0
var servanttotal = 0
#player
var max_hp = 15
var hp = 15 setget set_hp
var defense = 1
export var souls = 0
var soulbonus = 0.01
var totalsouls = 0
var attack = 1
export (float) var regen = 0.01
# affected by the passive skills
var skill_attack_bonus = 1
var skill_defense_bonus = 1
var skill_hp_bonus = 1
# affected by level increase
var attack_level_bonus = 1
var defense_level_bonus = 1
var hp_level_bonus = 1
# stating stats for player can be affected by other skills
var baseattack = 1
var basedefense = 1
var basemaxhp = 15
#equipment stat
var weaponstat = 0
var ID
var damage
func set_hp(newhp):
	hp = newhp
	if hp <= 0:
		hp = 0
		emit_signal("ondeath")

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
	hp = max_hp
	stat_increase(1)
	hp_increase(5)
	pass


func stat_increase(amount):
	attack_level_bonus += amount
	defense_level_bonus += amount
	pass

func hp_increase(amount):
	hp_level_bonus += amount
	pass

# Every time the player kill an enemy
func soul_gain(amount):
	souls += amount
	totalsouls += amount
	pass


func _on_Timer_timeout():
	if hp < max_hp:
		hp += (max_hp * regen)
	pass # Replace with function body.

func _process(delta):
	attack = round(baseattack + (attack_level_bonus + skill_attack_bonus + weaponstat) * (1 + (souls * soulbonus))) 
	defense = round(basedefense + (defense_level_bonus + skill_defense_bonus) * (1 + (souls * soulbonus)))
	max_hp = round(basemaxhp + (hp_level_bonus + skill_hp_bonus) * (1 + (souls * soulbonus))) 
	servantattack = (attack * servantattackbonus)
	hp = clamp(hp, 0 , max_hp)
	pass

var origin = ""
var slot = ""
var valid = false

var inv_data = {}
var equipment_data = {"Head": null,
		"Torso": null,
		"Legs": null,
		"Hand": 10001,
		"OffHand": null,
		"Accessory": null}
func _ready():
	var inv_data_file = File.new()
	inv_data_file.open("res://Grid Based Inventory/inv_data_file.json", File.READ)
	var inv_data_json = JSON.parse(inv_data_file.get_as_text())
	inv_data_file.close()
	inv_data = inv_data_json.result
	


