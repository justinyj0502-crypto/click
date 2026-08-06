extends Control

signal buy_click(name)

@onready var s = $"."
@onready var game = get_tree().current_scene
@onready var cakecount = $cake
@onready var pruj =  $"유제2"
@onready var prjj = $"전조2"
@onready var b1 = $"유제"
@onready var b2 = $"전조"
@onready var b3 = $"신도"
@onready var b4 = $TextureButton
@onready var b5 = $TextureButton2
@onready var b6 = $TextureButton3



func close() -> void:
	s.visible = false
	$AudioStreamPlayer2D.play()
func _on_유제_pressed() -> void:
	if Global.cake >= Global.pru:
		Global.spend_cake(Global.pru)
		Global.pru *= 1.3
		pruj.text = Global.format_number(Global.pru) + "cake🍰"
		Global.cc += 1
		Global.gt += 1
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b1, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b1, "scale", Vector2(1, 1), 0.08)

func _on_전조_pressed() -> void:
	if Global.cake >= Global.prj:
		Global.spend_cake(Global.prj)
		Global.prj *= 1.3
		$"신도2".text = Global.format_number(Global.prj) + "cake🍰"
		Global.cc += 15
		Global.ov += 1
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b2, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b2, "scale", Vector2(1, 1), 0.08)

func _on_신도_pressed() -> void:
	if Global.cake >= Global.prs:
		Global.spend_cake(Global.prs)
		Global.prs *= 1.3
		prjj.text = Global.format_number(Global.prs) + "cake🍰"
		Global.cc += 100
		Global.bt += 1
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b3, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b3, "scale", Vector2(1, 1), 0.08)

func _on_texture_button_pressed() -> void:
	if Global.cake >= Global.pth:
		Global.spend_cake(Global.pth)
		Global.pth *= 1.3
		$Label8.text = Global.format_number(Global.pth) + "cake🍰"
		Global.cc += 1200
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b4, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b4, "scale", Vector2(1, 1), 0.08)
func _on_texture_button_2_pressed() -> void:
	if Global.cake >= Global.pbt:
		Global.spend_cake(Global.pbt)
		Global.pbt *= 1.3
		$Label5.text = Global.format_number(Global.pbt) + "cake🍰"
		Global.cc += 6000
		Global.bb += 1
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b5, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b5, "scale", Vector2(1, 1), 0.08)
func _on_texture_button_3_pressed() -> void:
	if Global.cake >= Global.pgh:
		Global.spend_cake(Global.pgh)
		Global.pgh *= 1.3
		$Label11.text = Global.format_number(Global.pgh) + "cake🍰"
		Global.cc *= 2
		Global.sh += 1
		$AudioStreamPlayer2D2.play()
	else:
		$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b6, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b6, "scale", Vector2(1, 1), 0.08)
func _ready():
	Global.cake_changed.connect(update)
	update_prices()

	pruj.text = Global.format_number(Global.pru) + "cake🍰"
	$"신도2".text = Global.format_number(Global.prj) + "cake🍰"
	prjj.text = Global.format_number(Global.prs) + "cake🍰"

	update()

func update(_cake = 0):
	cakecount.text = "케이크: " + Global.format_number(Global.cake)
func update_prices():
	pruj.text = Global.format_number(Global.pru) + "cake🍰"
	$"신도2".text = Global.format_number(Global.prj) + "cake🍰"
	prjj.text = Global.format_number(Global.prs) + "cake🍰"
	$Label8.text = Global.format_number(Global.pth) + "cake🍰"
	$Label5.text = Global.format_number(Global.pbt) + "cake🍰"
	$Label11.text = Global.format_number(Global.pgh) + "cake🍰"
	print("update_prices:", Global.pru)
