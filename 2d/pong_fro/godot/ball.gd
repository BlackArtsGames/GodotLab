extends KinematicBody2D

var MAX_VELOCITY = 300
var velocity = Vector2.ZERO


func _ready():
	"""
	Initial velocity

	:param arg: Argument...
	:return: Randomized initial velocity
	"""
	randomize() 
	velocity.x = [-1,1][randi() % 2] 
	velocity.y = [-0.8,0.8][randi() % 2] 
	
func _physics_process(delta):
	var collission_object = move_and_collide(velocity * MAX_VELOCITY * delta) # move the ball and store the collission data(if available)
	if collission_object:
		velocity = velocity.bounce(collission_object.normal)
		
func stop_ball():	
	position = Vector2(320,256)
	velocity = Vector2(0,0)

func reset_ball_with_inertia():
	position = Vector2(320,256)
