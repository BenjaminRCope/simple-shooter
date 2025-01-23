extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _ready():
	$LaserTTL.start()

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("hit"):
		body.hit()
	queue_free()

func _on_laser_ttl_timeout() -> void:
	queue_free()
