extends KinematicBody2D

var MAX_VELOCITY = 200

func _ready():
	pass

func _physics_process(delta):
	#Movement
	var input_vector = Vector2.ZERO
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() # not really necesary??
	move_and_slide(input_vector * MAX_VELOCITY)
