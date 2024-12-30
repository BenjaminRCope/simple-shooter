extends Node2D

func _ready():
	pass
	
func _process(delta):
	if $Sprite2D.position.x >= 1000:
		$Sprite2D.position.x = 0
