extends Node

var player_score = 0
var opponent_score = 0


func score_achieved(score):
	"""
	Stops the ball, starts the count down and sums one into the score.
	"""
	get_tree().call_group("BallGroup", "stop_ball")
	$CountDownLabel.visible = true
	$CountDownTimer.start()
	return score + 1


func _on_PlayerGoal_body_entered(body):
	"""
	Checks if Opponent makes point
	"""
	opponent_score = score_achieved(opponent_score)


func _on_OpponentGoal_body_entered(body):
	"""
	Checks if Player makes point
	"""
	player_score = score_achieved(player_score)


func _process(delta):
	"""
	Show Scores and countdown when it is active.
	"""
	$PlayerScore.text = str(player_score)
	$OpponentScore.text = str(opponent_score)
	
	$CountDownLabel.text = str(int($CountDownTimer.time_left * 5))


func _on_CountDownTimer_timeout():
	"""
	Restart ball and hice Countdown once it is over.
	"""
	get_tree().call_group("BallGroup", "restart_ball")
	$CountDownLabel.visible = false
