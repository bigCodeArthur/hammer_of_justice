class_name MeterBase extends Resource
@export var key : String

# data
@export var minCap := 0.0
@export var maxCap := 1000.0
@export var minValue := 0.0
@export var maxValue := 100.0
@export var currentValue := 100.0

# visual aspect
@export var icon: Texture2D
@export var color: Color
@export var uniqueIndicator: Texture2D


func add_value(value) -> void:
	currentValue = clamp(currentValue + value, minValue, maxValue)


func remove_value(value) -> void:
	currentValue = clamp(currentValue - value, minValue, maxValue)
