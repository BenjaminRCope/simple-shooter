extends CharacterBody2D

const speed = 300

func _process(_delta):
	var direction = Vector2(1,0)
	velocity = direction * speed
	
	move_and_slide()
