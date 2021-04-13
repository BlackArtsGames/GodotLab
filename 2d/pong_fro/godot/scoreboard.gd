extends Sprite

var points_P1
var points_P2
onready var display_P1 = get_node("P1")
onready var display_P2 = get_node("P2")
onready var timer = get_node("TimerGame")
onready var display_timer = get_node("timer_display")


func _ready():
	points_P1 = 0
	points_P2 = 0
	timer.start()
	
func _physics_process(delta):
	display_P1.text = str(points_P1)
	display_P2.text = str(points_P2)
	display_timer.text = str(int(timer.time_left))

func _on_Left_body_entered(body):
	points_P2 = points_P2 +1

func _on_Right_body_entered(body):
	points_P1 = points_P1 +1


