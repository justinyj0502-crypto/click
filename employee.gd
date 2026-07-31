extends Control

@onready var game = get_tree().current_scene
@onready var cakecount = $cake

var ptp = 300
var bkp = 18000
var rbp = 250000

func update(_cake = 0):
	cakecount.text = "케이크: " + str(snapped(Global.cake, 1))
func _ready() -> void:
	game.ck.connect(cake)
	Global.cake_changed.connect(update)
	update()

func cake(cake):
	$cake.text = "케이크: " + str(snapped(cake,1))

func _on_button_pressed() -> void:
	$".".visible = false

func _on_알바_pressed() -> void:
	if Global.cake >= 300:
		Global.cp += 5
		Global.spend_cake(300)
		ptp *= 1.3
		$"알바1/알바2/Label3".text = str(snapped(ptp,1)) + "cake🍰"

func _on_제빵사_pressed() -> void:
	if Global.cake >= 18000:
		Global.cp += 150
		Global.spend_cake(18000)
		bkp *= 1.3
		$"제빵사1/Label/Label".text = str(snapped(bkp,1)) + "cake🍰"
		
func _on_로봇_pressed() -> void:
	if Global.cake >= 250000:
		Global.cp += 1000
		Global.spend_cake(250000)
		rbp *= 1.3
		$"로봇1/Label/Label2/Label".text = str(snapped(rbp,1)) + "cake🍰"
