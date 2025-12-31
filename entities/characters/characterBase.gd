class_name characterBase extends CharacterBody3D

#var bodyPosList : Dictionary[String,CCFBodyPos3d]

@export var stats : PhysicsStats

var maxSpeed : Vector3
var accel : float
var decel : float
var jumpPower : float
var gravity : float
var maxFall : float


var desiredDirection := Vector3.ZERO
var inputDir := Vector3.ZERO
@export var applyDecel := true
@export var unlockX := false
@export var unlockY := true
@export var unlockZ := false


func _ready():
	maxSpeed = Vector3(
		stats.maxSpeed,
		stats.maxSpeed,
		stats.maxSpeed)
	accel = stats.accel
	decel = stats.decel
	jumpPower = stats.jumpPower
	gravity = stats.gravity
	maxFall = stats.maxFall

	#updateBodyPosList()


func _physics_process(_delta):

	desiredDirection = transform.basis * Vector3(
		inputDir.x, inputDir.y, inputDir.z
	).normalized()

	if unlockX:
		desiredDirection.x = 1
		maxSpeed.x = (velocity.x)
	if unlockY:
		desiredDirection.y = 1
		maxSpeed.y = (velocity.y)
	if unlockZ:
		desiredDirection.z = 1
		maxSpeed.z = (velocity.z)

	velocity = velocity.move_toward(
		Vector3(
			desiredDirection.x * maxSpeed.x,
			desiredDirection.y * maxSpeed.y,
			desiredDirection.z * maxSpeed.z
		), accel if inputDir else decel)

	move_and_slide()
	velocity = get_real_velocity()
	if applyDecel:
		inputDir = Vector3.ZERO


#func updateBodyPosList():
	#for child in get_children():
		#if child is CCFBodyPos3d:
			#bodyPosList[child.key] = child
