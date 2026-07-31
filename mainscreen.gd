extends Node2D



func start() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func end() -> void:
	get_tree().quit()
