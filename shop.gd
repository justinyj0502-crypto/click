extends Control

@onready var game = get_tree().current_scene
@onready var shop = $"."
@onready var cakecount = $Panel/cake


func close() -> void:
	shop.visible = false
	$AudioStreamPlayer2D.play()
func upgrade() -> void:
	$Control.visible = true
	$AudioStreamPlayer2D.play()
func _ready() -> void:
	game.ck.connect(cake)
	Global.cake_changed.connect(update)
	update()
func cake(cake):
	cakecount.text = "케이크: " + Global.format_number(Global.cake)
func update(_cake = 0):
	cakecount.text = "케이크: " + Global.format_number(Global.cake)

#func _on_texture_button_pressed() -> void:
#	$emplyee.visible = true


func _on_texture_button_pressed() -> void:
	$emplyee.visible = true
	$AudioStreamPlayer2D.play()


func _on_button_pressed() -> void:
	$Node2D.visible = true
	$AudioStreamPlayer2D.play()
