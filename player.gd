extends CharacterBody2D


@export var speed := 200


func get_input():
	var input_direction = (Input.is_action_pressed("move_down") as int) - (Input.is_action_pressed("move_up") as int)
	velocity = Vector2(0.0, input_direction as float) * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
