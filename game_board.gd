extends Node2D

@onready var ball = $Ball
@onready var opponent_score = $Scoreboard/OpponentScore
@onready var player_score = $Scoreboard/PlayerScore


func reset():
	$Timer.start()
	

func _on_left_wall_body_entered(_body):
	print( "resetting left")
	
	var current_score = opponent_score.text as int
	opponent_score.text = str(current_score + 1)
	reset()


func _on_right_wall_body_entered(_body):
	print( "resetting right")
	var current_score = player_score.text as int
	player_score.text = str(current_score + 1)
	reset()


func _on_timer_timeout():
	$Timer.stop()
	ball.start()
	
	
