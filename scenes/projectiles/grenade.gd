extends RigidBody2D

var speed = 750

func explode():
	$Explosion.visible = true
	$Sprite2D.visible = false
	$AnimationPlayer.play("Explosion")
