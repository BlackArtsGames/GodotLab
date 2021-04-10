extends KinematicBody2D

var MAX_VELOCITY = 200

func _ready():
	pass

func _physics_process(delta):
	"""
	Movement logic

	Inputs:
	:input ui_down: Input method <down arrow>
	:input ui_up: Input method <up arrow>
	
	Returns:
	:return: velocity vector for the player on a particular delta
	"""
	var input_vector = Vector2.ZERO
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() # not really necesary??
	move_and_slide(input_vector * MAX_VELOCITY)
