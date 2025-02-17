extends Area2D

var rotation_speed: int = 3
var possibleItems = ['laser', 'laser', 'grenade', 'health']
var type = possibleItems[randi() % len(possibleItems)]

var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	if (type == 'laser'):
		$Sprite2D.modulate = Color("0000FF")
	elif (type == 'grenade'):
		$Sprite2D.modulate = Color("008000")
	elif (type == 'health'):
		$Sprite2D.modulate = Color("FF0000")
		
	var target_position = position + direction * distance
	var movement_tween = create_tween()
	movement_tween.tween_property(self, 'position', target_position, 0.5)

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body: Node2D) -> void:
	if (type == 'laser'):
		Globals.laser_amount += 5
	elif (type == 'grenade'):
		Globals.grenade_amount += 2
	elif (type == 'health'):
		Globals.health += 10

	queue_free()
