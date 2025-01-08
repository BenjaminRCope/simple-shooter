extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _ready():
	pass
	
func _process(_delta):
	pass

func _on_gate_player_entered_gate(body) -> void:
	print("body has entered")
	print(body)

func _on_player_laser_input_detected(pos) -> void:
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)

func _on_player_grenade_input_detected() -> void:
	print("shoot grenade")
