extends CharacterBody2D

signal laser_input_detected(pos)
signal grenade_input_detected(pos)

const speed = 300

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		
		laser_input_detected.emit(selected_laser.global_position)
		can_laser = false
		$laserTimer.start()
		
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		
		grenade_input_detected.emit(selected_laser.global_position)
		can_grenade = false
		$grenadeTimer.start()

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
