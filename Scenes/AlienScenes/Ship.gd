extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ball_scene = preload("res://MiniScenes/Ball.tscn")
onready var fireDelayTimer = $FireDelayTimer
export var speed = 200
var velocity = Vector2(0,0)
var fireDelay = 0.5


func _process(delta):
	#press enter to spawn another ball
	if Input.is_action_just_pressed("ui_accept") and fireDelayTimer.is_stopped():
		fireDelayTimer.start(fireDelay)
		fire()
		
		#var ball = ball_scene.instance()
		#ball.position = position-Vector2(0,16)
		#get_tree().get_root().add_child(ball)
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
func fire():
	var bullet = preload("res://Scenes/AlienScenes/Bullet.tscn")
	var firedBullet = bullet.instance()
	$AudioStreamPlayer.play()
	firedBullet.position = Vector2(position.x, 0)
	get_tree().get_root().add_child(firedBullet)


