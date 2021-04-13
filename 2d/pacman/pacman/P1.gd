extends KinematicBody2D

const MAX_SPEED = 200
const MAX_ACCELERATION = 600
const FRICTION = 500

var velocity = Vector2.ZERO
onready var animationPlayer = $sprite/AnimationPlayer
onready var animationTree = $sprite/AnimationTree
func _ready():
	animationTree.active = true


func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down")  - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	animationTree.set("parameters/Move/blend_position", input_vector)
	velocity = velocity.move_toward(input_vector * MAX_SPEED, MAX_ACCELERATION * delta)
	velocity = move_and_slide(velocity)
