extends RigidBody2D

var speed = 750
var explosion_is_active: bool = false
var explosion_radius: int = 400

func explode():
	explosion_is_active = true
	$Sprite2D.visible = false
	$PointLight2D.visible = false
	$".".sleeping = true
	$AnimationPlayer.play("Explosion")
	$CollisionShape2D.disabled = true
	$Explosion.visible = true

func _process(_delta):
	if explosion_is_active:
		var targets = get_tree().get_nodes_in_group("Container")
		
		for target in targets:
			var in_range = target.global_position.distance_to() < explosion_radius
			if "hit" in target and in_range:
				target.hit()
