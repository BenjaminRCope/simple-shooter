extends ItemContainer

@onready var direction: Vector2 = Vector2.DOWN.rotated(rotation)
var crate_opened: bool = false

signal open(pos, direction)

func hit():
	if not crate_opened:
		crate_opened = true
		$BoxLid.hide()
		for i in range(5):
			var pos = $SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count()).global_position
			open.emit(pos, direction)
