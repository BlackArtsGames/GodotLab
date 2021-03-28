extends Node2D

var n = 20 # Max points of the game
var message = ""
onready var ball = get_node("ball")
onready var scoreboard = get_node("scoreboard")
onready var endgame = get_node("endgame")
onready var timer = get_node("scoreboard/TimerGame")


func _process(delta):
	if scoreboard.points_P1 == n:
		endgame.text = "P1 Wins"
		ball.stop_ball()
		timer.stop()
		
	if scoreboard.points_P2 == n:
		endgame.text = "P2 Wins"
		ball.stop_ball()
		timer.stop()

func _on_Left_body_entered(body):
	ball.reset_ball_with_inertia()

func _on_Right_body_entered(body):
	ball.reset_ball_with_inertia()

func _on_TimerGame_timeout():
	if scoreboard.points_P1 == scoreboard.points_P2:
		endgame.text = "Draw!"
	if scoreboard.points_P1 > scoreboard.points_P2:
		endgame.text = "P1 Wins"
	else:
		endgame.text = "P2 Wins"
