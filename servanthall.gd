extends Control
onready var player = $player

var enchanceprice = 100
var summonprice = 100
var trainprice = 100
var enchannceamount = 0
var summonamount = 0
var trainamount = 0


func _on_Mansion_pressed():
	get_tree().change_scene("res://Mainscene.tscn")
	pass # Replace with function body.


func _on_enchancebutton_pressed():
	if  player.souls >= enchanceprice:
		player.souls -=  enchanceprice
		enchannceamount += 1
		enchanceprice = ((enchannceamount * .5 ) * (1.01 * enchanceprice))
	pass # Replace with function body.


func _on_trainbutton_pressed():
	if  player.souls >= trainprice:
		player.souls -=  trainprice
		trainamount += 1
		trainprice = round(((trainamount * .5 ) * (1.01 * trainprice)))
	pass # Replace with function body.


func _on_summonbutton_pressed():
	if  player.souls >= summonprice:
		player.souls -=  summonprice
		summonamount += 1
		summonprice = round(((summonamount * .5 ) * (1.01 * summonprice)))

	pass # Replace with function body.

func _process(delta):
	if player.souls >= enchanceprice:
		$enchanceservantcontrol/EnchanceServant/Panel2/enchancebutton.disabled = false
		$summonservantcontrol/Summonservnat/sumprice/summonbutton.disabled = false
		$upgradeservantcontrol/Upgradeservant/trainprice/trainbutton.disabled = false
	else:
		$enchanceservantcontrol/EnchanceServant/Panel2/enchancebutton.disabled = true
		$summonservantcontrol/Summonservnat/sumprice/summonbutton.disabled = true
		$upgradeservantcontrol/Upgradeservant/trainprice/trainbutton.disabled = true
	
	
	$enchanceservantcontrol/EnchanceServant/Panel2/enchaceprice.text = "Souls:" + str(round(enchanceprice))
	$summonservantcontrol/Summonservnat/sumprice/summonprice.text = "Souls:" + str(round(summonprice))
	$upgradeservantcontrol/Upgradeservant/trainprice/trainprice.text = " Souls:" + str(round(trainprice))
	pass
