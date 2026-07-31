extends Node2D

signal ck(count:int)

signal ujpr(price:int)
signal jjpr(price:int)
signal sdpr(price:int)

signal pt(price:int)

@onready var a = $"cake count"
@onready var s = $shop
@onready var c = $shop/Control
@onready var b = $Button
@onready var floating_text = $Node2D

var prs := 8000
var prj := 600
var pru := 50

var cc = 1

func _ready() -> void:
	c.buy_click.connect(test)
	Global.cake_changed.connect(update)
	update()
func _on_button_pressed() -> void:
	Global.add_cake(cc)

	var tween = create_tween()
	tween.tween_property(b, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b, "scale", Vector2(1, 1), 0.08)

	update()
	show_plus()

func update(_cake = 0):
	a.text = "케이크: " + str(snapped(Global.cake, 1))

func shopopen() -> void:
	s.visible = true

func _physics_process(_delta):
	if Input.is_action_just_pressed("shop"):
		s.visible = true
	elif Input.is_action_just_pressed("close"):
		s.visible = false

func test(name):
	match name:
		"uj":
			if Global.cake >= pru:
				Global.spend_cake(pru)
				Global.cc += 1
				pru *= 1.3
				ujpr.emit(pru)

		"jj":
			if Global.cake >= prj:
				Global.spend_cake(prj)
				Global.cc += 15
				prj *= 1.3
				jjpr.emit(prj)

		"sd":
			if Global.cake >= prs:
				Global.spend_cake(prs)
				Global.cc += 100
				prs *= 1.3
				sdpr.emit(prs)

	update()



	update()

func _on_timer_timeout() -> void:
	Global.add_cake(Global.cp)
	update()


func _process(_delta):
	if Global.cake >= 1000000:
		get_tree().change_scene_to_file("res://ending.tscn")

func show_plus():
	var label = Label.new()

	label.text = "+" + str(cc)
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
