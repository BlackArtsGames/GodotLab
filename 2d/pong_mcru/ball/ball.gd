extends KinematicBody2D

var INITIAL_SPEED = 400
var INITIAL_POSITIION = Vector2(512, 300)
var MAX_ANGLE = PI / 3

var speed = INITIAL_SPEED
var velocity = Vector2.ZERO


func to_radians(deg):
	"""
	Converts angles in degrees to radians
	
	:param deg: Integer or floating point angle in degrees.
	:return: angle in radians.
	"""
	return deg * PI / 180


func set_direction():
	"""
	Initialize direction as vector of velocity (x, y)
	
	:param method: Method to calculate the direction -> "a" or "b".
	:return: List of [velocity_x, velocity_y]
	"""
	randomize()
	
	var method = "b"
	
	if method == "a":
		var angle = to_radians(randi() % 360)
		
		velocity.x = cos(angle)
		velocity.y = sin(angle)
	
	elif method == "b":
		var rd = rand_range(0, 1)
		var h_dir = [-1, 1][randi() % 2]
		var v_dir = [-1, 1][randi() % 2]
		var theta = acos(1 - rd * (1 - cos(MAX_ANGLE)))
		
		velocity.x = cos(theta) * h_dir
		velocity.y = sin(theta) * v_dir


func stop_ball():
	"""
	Set ball static at the middle of the screen.
	"""
	speed = 0
	position = INITIAL_POSITIION


func restart_ball():
	"""
	Set ball moving again.
	"""
	speed = INITIAL_SPEED
	set_direction()


func _ready():
	"""
	Called when the node enters the scene tree for the first time.
	Set initial speed with random direction.
	"""
	
	set_direction()


func _physics_process(delta):
	"""
	Makes the ball be a physic object which increases its speed 
	when it hits any palette.
	"""
	var collision_object = move_and_collide(velocity * speed * delta)
	
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		if collision_object.collider.name in ["Player", "Opponent"]:
			velocity *= 1.05
