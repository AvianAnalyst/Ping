extends CharacterBody2D

@export var speed = 200
@onready var ball = get_node("../Ball") as Node2D
var direction = Vector2.ZERO

func determine_direction():
	if ball:
		var ball_height = ball.global_position.y
		if ball_height > position.y:
			direction = Vector2.DOWN
		elif ball_height < position.y:
			direction = Vector2.UP
		else:
			direction = Vector2.ZERO
		velocity = direction.normalized() * speed
	else:
		ball = get_tree().get_first_node_in_group("balls")

func _physics_process(delta):
	determine_direction()
	move_and_slide()



func _on_board_child_exiting_tree(node):
	ball = null


func _on_board_child_entered_tree(node):
	ball = node 
