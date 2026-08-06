extends Node2D


func _on_button_pressed() -> void:
	if Global.cake >= 3000000000:
			get_tree().change_scene_to_file("res://ending.tscn")




func _on_button_2_pressed() -> void:
	$".".visible = false
	$AudioStreamPlayer2D.play()
