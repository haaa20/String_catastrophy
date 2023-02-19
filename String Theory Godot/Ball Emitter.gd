extends Node2D


func shoot_ball():
	var new_ball = preload("res://Classes/Ball.tscn").instance()
	add_child(new_ball)
	new_ball.velocity = Vector2.DOWN * 200
	new_ball.add_to_group("Ball")


func _on_Lever_pulled():
	print("Beep")
	shoot_ball()
