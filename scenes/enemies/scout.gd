extends CharacterBody2D

var scout_activated: bool = false
var can_laser: bool = true
var use_right_gun: bool = false

signal laser(pos, direction)

func hit():
	print('scout hit')

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
