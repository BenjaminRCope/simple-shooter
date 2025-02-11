extends CanvasLayer

# color values
var green: Color = Color("6bbfa3")
var red: Color = Color("FF0000")

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var health_bar: TextureProgressBar = $MarginContainer/TextureProgressBar

func _ready():
	Globals.connect("stat_change", update_stat_text)

func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, $LaserCounter/VBoxContainer)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, $GrenadeCounter/VBoxContainer)
	
func update_health_text():
	health_bar.value = Globals.health
	
func update_stat_text():
	update_health_text()
	update_laser_text()
	update_grenade_text()

func update_color(amount: int, container: VBoxContainer) -> void:
	if amount <= 0:
		container.modulate = red
	else:
		container.modulate = green
