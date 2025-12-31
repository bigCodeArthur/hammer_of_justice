class_name PlayerBar extends Control

# name of the meter that this bar tracks
@export var meterKey: String

# node references
@onready var ui: CCFUI = $".."
@onready var border: NinePatchRect = $Border
@onready var indicator: NinePatchRect = $Mask/Indicator
@onready var icon: TextureRect = $Icon

# external node refs (set via external script)
var meterRef: MeterBase
var value: float

# scale of the bar (ex: when increasing max health)
const HARD_CAP : int = 500
const HARD_MIN : int = 0
@onready var min_view_size := border.patch_margin_left + border.patch_margin_right
@onready var max_view_size := ui.size.x * (1 / scale.x)

# value of the bar (ex: when healing or taking damage)
@onready var min_value := indicator.position.x - indicator.size.x
@onready var max_value := indicator.position.x


func _process(_delta: float) -> void:
	update()


func set_meter(meter: MeterBase) -> void:
	meterRef = meter

	if meterRef:
		size.x = remap(
			meterRef.maxValue,
			meterRef.minCap,
			meterRef.maxCap,
			min_view_size,
			max_view_size
		)

		if meterRef.uniqueIndicator:
			indicator.texture = meterRef.uniqueIndicator
		indicator.modulate = meterRef.color
		icon.texture = meterRef.icon


func update() -> void:
	if meterRef:
		value = meterRef.currentValue
		set_indicator()


func set_indicator() -> void:
	var new_position : Vector2

	new_position.x = remap(
		value, 
		meterRef.minValue, 
		meterRef.maxValue, 
		min_value, 
		max_value
	)

	indicator.position = new_position
