extends KinematicBody2D


# Declare member variables here. Examples:
var a = 0
# var b = "text"
const ball_scene = preload("res://MiniScenes/Ball.tscn")

export var speed = 200
var velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_fixed_process(true)
	pass
	
func _process(delta):
	#press enter to spawn another ball
	if a <= 0:
		Input.is_action_just_pressed("ui_accept")
		var ball = ball_scene.instance()
		ball.position = position-Vector2(0,16)
		get_tree().get_root().add_child(ball)
		
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		
		
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x = 0
	
	move_and_slide(velocity,Vector2(0,0))
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("walls"):
			velocity.x = 0
		

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
