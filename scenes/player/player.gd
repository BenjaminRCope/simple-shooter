extends Node2D

const speed = 300

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * speed * delta
	
	if Input.is_action_just_pressed("primary action"):
		print("pew pew")
