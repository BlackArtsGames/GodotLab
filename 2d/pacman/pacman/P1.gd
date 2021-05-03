extends KinematicBody2D


const MAX_SPEED = 100
const MAX_ACCELERATION = 6000


var velocity = Vector2.ZERO
var inertia_vector = Vector2.ZERO
var points = 0

onready var animationPlayer = $sprite/AnimationPlayer
onready var animationTree = $sprite/AnimationTree


func _ready():
	animationTree.active = true

func _process(delta):
	var input_vector = Vector2.ZERO
	
	if Input.get_action_strength("ui_down") or Input.get_action_strength("ui_up") or Input.get_action_strength("ui_right") or Input.get_action_strength("ui_left"):
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down")  - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
		inertia_vector = input_vector
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/move/blend_position", input_vector)
		velocity = velocity.move_toward(input_vector * MAX_SPEED, MAX_ACCELERATION * delta)
		velocity = move_and_slide(velocity)
	else:
		velocity = velocity.move_toward(inertia_vector * MAX_SPEED, MAX_ACCELERATION * delta)
		velocity = move_and_slide(velocity)


func _on_rightExit2_body_entered(body):
	position.x = 0

func _on_leftExit_body_entered(body):
	position.x = 400

func _on_ball_body_entered(body):
	points += 1 
	print(str(points))


