extends CharacterBody2D

var scout_activated: bool = false
var can_laser: bool = true
var use_right_gun: bool = true
var can_be_damaged: bool = true

signal laser(pos, direction)
signal drop_item(pos, direction)

@onready var item_direction: Vector2 = Vector2.DOWN.rotated(rotation)

var health: int = 30

func hit():
	if can_be_damaged:
		can_be_damaged = false
		$DamageInvulnWindow.start()
		scout_activated = true
		
		health -= 10
		if health > 0:
			var tween = get_tree().create_tween()
			tween.tween_property($Sprite2D, "material:shader_parameter/progress", .4, .1)
			tween.tween_property($Sprite2D, "material:shader_parameter/progress", 0, .1)
		
		if health <= 0:
			kill_scout()
			
func kill_scout():
	var pos = $SpawnPosition.global_position
	drop_item.emit(pos, item_direction)
	queue_free()

func _process(_delta):
	if (scout_activated):
		look_at(Globals.player_pos)
		
		if (can_laser):
			var marker_node = $LaserSpawnPosition.get_child(use_right_gun)
			use_right_gun = not use_right_gun
			var pos: Vector2 = marker_node.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			
			can_laser = false
			$LaserCooldown.start()

func _on_attack_area_body_entered(_body: Node2D) -> void:
	scout_activated = true

func _on_laser_cooldown_timeout() -> void:
	can_laser = true

func _on_damage_invuln_window_timeout() -> void:
	can_be_damaged = true
	#$Sprite2D.material.set_shader_parameter("progress", 0)
