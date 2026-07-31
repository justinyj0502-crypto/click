extends Control

@onready var game = get_tree().current_scene
@onready var shop = $"."
@onready var cakecount = $Panel/cake


func close() -> void:
	shop.visible = false

func upgrade() -> void:
	$Control.visible = true

func _ready() -> void:
	game.ck.connect(cake)
	Global.cake_changed.connect(update)
	update()
func cake(cake):
	cakecount.text = "케이크: " + str(snapped(cake,1))
func update(_cake = 0):
	cakecount.text = "케이크: " + str(snapped(Global.cake, 1))

#func _on_texture_button_pressed() -> void:
#	$emplyee.visible = true


func _on_texture_button_pressed() -> void:
	$emplyee.visible = true
