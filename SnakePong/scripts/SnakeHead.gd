extends KinematicBody2D

const SPEED = 100

var input_dir := Vector2.RIGHT
var move_dir := Vector2.RIGHT
var turn_rate = 0.1

func _physics_process(delta: float) -> void:
	# if you press multiple keys at the same time
	# it will prioritze the last checked keys
	if Input.is_action_just_pressed("move_right"):
		input_dir = Vector2.RIGHT
	if Input.is_action_just_pressed("move_left"):
		input_dir = Vector2.LEFT
	if Input.is_action_just_pressed("move_up"):
		input_dir = Vector2.UP
	if Input.is_action_just_pressed("move_down"):
		input_dir = Vector2.DOWN
	move_dir.x = move_toward(move_dir.x, input_dir.x, turn_rate)
	move_dir.y = move_toward(move_dir.y, input_dir.y, turn_rate)
	move_and_slide(move_dir * SPEED)

