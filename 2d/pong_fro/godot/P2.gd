extends KinematicBody2D

var MAX_VELOCITY = 200
var ball

func _ready():
	ball = get_parent().find_node("ball") # Import ball scene
	
func _physics_process(delta):
	move_and_slide(Vector2(0, get_P2_direction()) * MAX_VELOCITY)
	
func get_P2_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: 
			return 1
		else:
			return -1
	else:
		return 0
		
