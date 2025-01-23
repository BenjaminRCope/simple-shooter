extends RigidBody2D

var speed = 750

func explode():
	$Sprite2D.visible = false
	$PointLight2D.visible = false
	$AnimationPlayer.play("Explosion")
	$Explosion.visible = true
