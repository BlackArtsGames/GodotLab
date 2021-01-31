extends KinematicBody2D

var speed = 400
var ball


func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25 and \
			(ball.velocity.x > 0 or \
			(ball.position.x > 600 and ball.velocity.x < 0)):
		
		if ball.position.y > position.y: return 1
		else: return -1
	
	else: return 0


func _ready():
	"""
	Called when the node enters the scene tree for the first time.
	"""
	ball = get_parent().find_node("Ball")


func _physics_process(delta):
	move_and_slide(Vector2(0, get_opponent_direction()) * speed)
