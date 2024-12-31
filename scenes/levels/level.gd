extends Node2D

func _ready():
	pass
	
func _process(_delta):
	if $Sprite2D.position.x >= 1000:
		$Sprite2D.position.x = 0
		
	#if Input.is_action_pressed("left"):
