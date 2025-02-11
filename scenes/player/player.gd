extends CharacterBody2D

signal laser_input_detected(pos, direction)
signal grenade_input_detected(pos, direction)
signal update_stats()

@export var max_speed: int = 500
var speed: int = max_speed

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	# handle directional inputs
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# handle mouse movement (player rotation)
	look_at(get_global_mouse_position())
	
	# handle laser inputs
	if Input.is_action_just_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$FiringLaserEffect.emitting = true
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		
		laser_input_detected.emit(selected_laser.global_position, player_direction)
		can_laser = false
		$laserTimer.start()
		
	# handle grenade inputs
	if Input.is_action_just_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		
		grenade_input_detected.emit(selected_laser.global_position, player_direction)
		can_grenade = false
		$grenadeTimer.start()

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true

func add_item(type: String):
	if (type == 'laser'):
		Globals.laser_amount += 5
	elif (type == 'grenade'):
		Globals.grenade_amount += 2
	elif (type == 'health'):
		pass
		
	update_stats.emit()
