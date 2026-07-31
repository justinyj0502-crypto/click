extends Node2D

signal ck(count:int)

signal ujpr(price:int)
signal jjpr(price:int)
signal sdpr(price:int)

signal pt(price:int)
#@onready var canvas = $CanvasLayer
@onready var a = $"cake count"
@onready var s = $shop
@onready var g = $"."
@onready var c = $shop/Control
@onready var up = get_parent()
@onready var b = $Button
#@onready var e = $shop/emplyee

@export var prs = 8000
@export var ptp = 888
@export var prj = 600
@export var pru = 50
@onready var floating_text = $Node2D

var cake = 0.1
var cc = 1
var cp = 0

func _on_button_pressed() -> void:
	cake += cc
	var tween = create_tween()
	tween.tween_property(b, "scale", Vector2(0.95, 0.95), 0.05)
	tween.tween_property(b, "scale", Vector2(1, 1), 0.08)
	update()
	show_plus()

func _ready() -> void:
	update()
	c.buy_click.connect(test)
	#e.alba.connect(cps)
	#$tuto.visible = true
	#$Label.visible = true
func update():
	a.text = "케이크: " + str(snapped(cake,1))
	ck.emit(cake)

func shopopen() -> void:
	s.visible = true 
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("shop"):
		s.visible = true
	elif Input.is_action_just_pressed("close"):
		s.visible = false
	
func test(name):
	if name == "uj":
		if cake >= pru:
			cc += 1
			cake -= pru
			pru *= 1.3
			ujpr.emit(pru)
	elif name == "jj":
		if cake >= prj:
			cc += 15
			cake -= prj
			prj *= 1.3
			jjpr.emit(prj)
	elif name == "sd":
		if cake >= prs:
			cc += 100
			cake -= prs
			prs *= 1.3
			sdpr.emit(prs)
	update()
func cps(name):
	match name:
		"parttime":
			if cake >= 50:
				cp += 1
				cake -= 50
				ptp *= 1.3
				pt.emit(ptp)
	update()

func _on_timer_timeout() -> void:
	cake += cp
	update()
func _process(delta: float) -> void:
	if cake >= 10000:
		get_tree().change_scene_to_file("res://ending.tscn")
func show_plus():
	var label = Label.new()

	label.text = "+" + str(cc)
	label.position = b.position + Vector2(40, -20)
	label.add_theme_font_size_override("font_size", 60) # 글자 크기
	label.add_theme_color_override("font_color", Color("#f4c542")) # 글자 색

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


#func _on_tuto_pressed() -> void:
	#$tuto.visible = false
	#$Label.visible = false
