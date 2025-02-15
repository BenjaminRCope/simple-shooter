extends ItemContainer

@onready var direction: Vector2 = Vector2.DOWN.rotated(rotation)

signal open(pos, direction)

func hit():
	$BoxLid.hide()
	var pos = $SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count()).global_position
	
	open.emit(pos, direction)
