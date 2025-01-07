extends StaticBody2D

signal player_entered_gate

func _on_gate_entrance_body_entered(body: Node2D) -> void:
	player_entered_gate.emit()
