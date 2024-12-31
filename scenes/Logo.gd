extends Sprite2D

const speed = 100

func _ready():
	position = Vector2(100, 100)

func _process(delta):
	position.x += speed * delta
