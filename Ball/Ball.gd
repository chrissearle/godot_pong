extends KinematicBody2D

export var speed = 600

var actual_speed = speed

var velocity = Vector2.ZERO

func _ready():
	stop_ball()
	
func _physics_process(delta):
	var collision_object = move_and_collide(velocity * actual_speed * delta)

	if collision_object:
		$HitSound.play()
		velocity = velocity.bounce(collision_object.normal)

func random_velocity():
	randomize()
	velocity.x = [1,-1][randi() % 2]
	velocity.y = [0.8,-0.8][randi() % 2]

func stop_ball():
	var w = get_viewport().size
	position = Vector2(w.x / 2,w.y / 2)
	actual_speed = 0
	
func start_ball():
	actual_speed = speed
	random_velocity()
