extends Node2D

signal ck(count:int)


@onready var a = $"cake count"
@onready var s = $shop
@onready var c = $shop/Control
@onready var b = $Button
@onready var floating_text = $Node2D


func _ready() -> void:
	Global.cake_changed.connect(update)
	Global.load_game()
	$shop/Control.update_prices()
	update()
func _on_button_pressed() -> void:
	Global.add_cake(Global.cc)
	$AudioStreamPlayer2D3.play()
	var tween = create_tween()
	tween.tween_property(b, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b, "scale", Vector2(1, 1), 0.08)
	$AudioStreamPlayer2D3.play()
	update()
	show_plus()

func update(_cake = 0):
	a.text = "케이크: " + Global.format_number(Global.cake)

func shopopen() -> void:
	s.visible = true
	$AudioStreamPlayer2D2.play()
func _physics_process(_delta):
	if Input.is_action_just_pressed("shop"):
		s.visible = true
	elif Input.is_action_just_pressed("close"):
		s.visible = false

func _on_timer_timeout() -> void:
	Global.add_cake(Global.cp)
	update()


func _process(_delta):
	$AnimatedSprite2D.play("default")
	if Global.gt > 0:
		$Sprite2D7.visible = true
	if Global.ov > 0:
		$Sprite2D8.visible = true
	if Global.bt > 0:
		$Sprite2D9.visible = true
	if Global.bb > 0:
		$Sprite2D10.visible = true
	if Global.sh > 0:
		$Sprite2D11.visible = true
func show_plus():
	var label = Label.new()

	label.text = "+" + Global.format_number(Global.cc)
	label.position = b.position + Vector2(40, -20)

	label.add_theme_font_size_override("font_size", 60)
	label.add_theme_color_override("font_color", Color("#f4c542"))

	floating_text.add_child(label)

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)

	tween.parallel().tween_property(
		label,
		"position",
		label.position + Vector2(0, -50),
		0.5
	)

	tween.parallel().tween_property(
		label,
		"modulate:a",
		0.0,
		0.5
	)

	tween.finished.connect(label.queue_free)


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://mainscreen.tscn")
	Global.save_game()
