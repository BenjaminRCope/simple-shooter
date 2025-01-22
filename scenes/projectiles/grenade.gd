extends RigidBody2D

var speed = 750

#func _init(delta: float) -> void:
	#$Explosion.visible = false

func explode():
	$Explosion.visible = true
	$AnimationPlayer.play("Explosion")
