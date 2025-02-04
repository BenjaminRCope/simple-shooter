extends RigidBody2D

var speed = 750

func explode():
	$Sprite2D.visible = false
	$PointLight2D.visible = false
	$".".sleeping = true
	$AnimationPlayer.play("Explosion")
	$CollisionShape2D.disabled = true
	$Explosion.visible = true
