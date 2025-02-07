extends CanvasLayer

# color values
var green: Color = Color("6bbfa3")
var red: Color = Color("FF0000")

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label

func _ready():
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, $LaserCounter/VBoxContainer)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, $GrenadeCounter/VBoxContainer)

func update_color(amount: int, container: VBoxContainer) -> void:
	if amount <= 0:
		container.modulate = red
	else:
		container.modulate = green
