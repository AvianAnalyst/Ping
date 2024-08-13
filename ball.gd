extends RigidBody2D

var direction: Vector2
var speed := 8

func reset():
	position = Vector2(600, 300)
	direction = Vector2.ZERO

func start():
	direction = Vector2.RIGHT.rotated(randf() * PI / 2 - PI / 4)

func _ready():
	reset()
	start()
	
	
func _physics_process(delta):
	var collision = move_and_collide(direction.normalized() * speed)
	if collision:
		var collider = collision.get_collider()
		print(collider)
		direction = (direction.bounce(collision.get_normal()) + collision.get_collider_velocity().normalized() / 2).normalized()

func _on_right_wall_body_entered(_body):
	remove_from_group("balls")
	reset()


func _on_left_wall_body_entered(_body):
	remove_from_group("balls")
	reset()
