extends Control

@onready var game = get_tree().current_scene
@onready var cakecount = $cake
@onready var b1 = $"알바"
@onready var b2 = $"제빵사"
@onready var b3 = $"로봇"

var ptp = 300
var bkp = 18000
var rbp = 250000

func update(_cake = 0):
	cakecount.text = "케이크: " + Global.format_number(Global.cake)
func _ready() -> void:
	game.ck.connect(cake)
	Global.cake_changed.connect(update)
	update()

func cake(cake):
	$cake.text = "케이크: " + Global.format_number(Global.cake)

func _on_button_pressed() -> void:
	$".".visible = false
	$AudioStreamPlayer2D.play()
func _on_알바_pressed() -> void:
	if Global.cake >= ptp:
		Global.cp += 5
		Global.spend_cake(ptp)
		ptp *= 1.3
		$"알바1/알바2/Label3".text = Global.format_number(ptp) + "cake🍰"
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b1, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b1, "scale", Vector2(1, 1), 0.08)
func _on_제빵사_pressed() -> void:
	if Global.cake >= bkp:
		Global.cp += 150
		Global.spend_cake(bkp)
		bkp *= 1.3
		$"제빵사1/Label/Label".text = Global.format_number(bkp) + "cake🍰"
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b2, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b2, "scale", Vector2(1, 1), 0.08)
func _on_로봇_pressed() -> void:
	if Global.cake >= rbp:
		Global.cp += 1000
		Global.spend_cake(rbp)
		rbp *= 1.3
		$"로봇1/Label/Label2/Label".text = Global.format_number(rbp) + "cake🍰"
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b3, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b3, "scale", Vector2(1, 1), 0.08)

func _on_button_2_pressed() -> void:
	$Control.visible = true
	$AudioStreamPlayer2D.play()
