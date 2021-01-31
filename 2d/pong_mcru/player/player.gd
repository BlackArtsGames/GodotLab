extends KinematicBody2D


var speed = 400


func _physics_process(delta):
	"""
	Called every frame.
	
	:param delta: Elapsed time since the previous frame.
	"""
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	move_and_slide(velocity * speed)


func _ready():
	"""
	Called when the node enters the scene tree for the first time.
	"""
	pass

 
func _process(delta):
	"""
	Called every frame.
	
	:param delta: Elapsed time since the previous frame.
	"""
	pass
