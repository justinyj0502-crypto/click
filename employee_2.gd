extends Control

@onready var game = get_tree().current_scene
@onready var cakecount = $cake
@onready var b1 = $TextureButton
@onready var b2 = $TextureButton2
@onready var b3 = $TextureButton3

var pbr = 250000
var pmt = 3000000
var pg = 250000

func update(_cake = 0):
	cakecount.text = "케이크: " + Global.format_number(Global.cake)
func _ready() -> void:
	Global.cake_changed.connect(update)
	update()

func _on_button_pressed() -> void:
	$".".visible = false
	$AudioStreamPlayer2D.play()
func _on_알바_pressed() -> void:
	if Global.cake >= pbr:
		Global.cp += 1000
		Global.spend_cake(pbr)
		pbr *= 1.3
		$Label5.text = Global.format_number(pbr)+ "cake🍰"
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b1, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b1, "scale", Vector2(1, 1), 0.08)
func _on_제빵사_pressed() -> void:
	if Global.cake >= pmt:
		Global.cp += 8000
		Global.spend_cake(pmt)
		pmt *= 1.3
		$Label6.text = Global.format_number(pmt) + "cake🍰"
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b2, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b2, "scale", Vector2(1, 1), 0.08)
func _on_로봇_pressed() -> void:
	if Global.cake >= pg:
		Global.cp *= 2
		Global.spend_cake(pg)
		pg *= 1.3
		$Label9.text = Global.format_number(pg)+ "cake🍰"
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b3, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b3, "scale", Vector2(1, 1), 0.08)
