extends LevelParent

func _on_scene_transition_body_entered(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	get_tree().change_scene_to_file.call_deferred("res://scenes/levels/outside.tscn")
