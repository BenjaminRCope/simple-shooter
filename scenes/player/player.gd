extends CharacterBody2D

const speed = 300

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("primary action") and can_laser:
		print("pew pew")
		can_laser = false
		$laserTimer.start()
		
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		print("shoot grenade")
		can_grenade = false
		$grenadeTimer.start()

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
