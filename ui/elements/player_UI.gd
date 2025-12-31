class_name CCFUI extends Control

var bars: Dictionary[String, PlayerBar]

@onready var brain: playerBrain = $"../PlayerBrain"
@onready var body : characterBase = get_owner()


func _ready() -> void:
	if not brain:
		return

	for child in get_children():
		if child is PlayerBar:
			bars[child.meterKey] = child
			child.set_meter(brain.meterList.get(child.meterKey))


func updateValue(value: String):
	var bar = bars.get(value)
	if bar:
		bar.update()
