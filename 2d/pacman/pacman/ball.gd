extends Area2D

func _on_ball_body_entered(body):
	queue_free()
