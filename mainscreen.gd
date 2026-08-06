extends Node2D



func start() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func end() -> void:
	get_tree().quit()

var moved := false
func _on_끝_mouse_entered() -> void:


	if moved:
		return

	moved = true

	$"리셋".visible = true

	var tween = create_tween()
	tween.tween_property(
		$"리셋",
		"position",
		$"리셋".position + Vector2(150, 0),
		0.2
	)

func _on_리셋_pressed() -> void:
	Global.reset_game()
func _on_도움말_pressed():
	get_tree().change_scene_to_file("res://tip.tscn")
