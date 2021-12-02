extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move_speed = 10
var shootingcount = rand_range(0,50)

onready var camera = $Camera2D/ScreenShake
onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()
func _process(delta):
	
	
	shootingcount = rand_range(0,50)
	$Sprite.texture = load("res://Sprites/boss2frame3Transparent.png")
	
	#print(Livecounter.alienBallCount)
	if Livecounter.alienBallCount < Livecounter.alienBallLimit and Livecounter.alienBallCount >= 0:
		var ball_scene = preload("res://Mini Scenes/AlienBall.tscn")
		var ball = ball_scene.instance()
		ball.position = position+Vector2(320,150)
		ball.linear_velocity.x = rand_range(-180,180)
		
		get_tree().get_root().add_child(ball)
		Livecounter.alienBallCount += 1
		
		_on_Timer_timeout()
	
		
	
		

	
		
func damage():
	
	$Sprite.texture = load("res://Sprites/boss2DamageTransparent.png")
	$AudioStreamPlayer2.play()
	camera.start()
	Livecounter.bossLives -= 1
	if(Livecounter.bossLives == 0):
		queue_free()
		




func _on_Timer_timeout():
	if shootingcount >= 40:
		var bullet = preload("res://Scenes/Alien Scenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x, position.y)
		get_tree().get_root().add_child(firedbullet)
		$AudioStreamPlayer.play()
	elif shootingcount >= 30:
		var bullet = preload("res://Scenes/Alien Scenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x + 140, position.y)
		get_tree().get_root().add_child(firedbullet)	
		$AudioStreamPlayer.play()
	elif shootingcount >= 20:
		var bullet = preload("res://Scenes/Alien Scenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x + -140, position.y)
		get_tree().get_root().add_child(firedbullet)	
		$AudioStreamPlayer.play()
	elif shootingcount >= 10:
		var bullet = preload("res://Scenes/Alien Scenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x + 90, position.y)
		get_tree().get_root().add_child(firedbullet)
		$AudioStreamPlayer.play()
	else:
		var bullet = preload("res://Scenes/Alien Scenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x-90, position.y)
		get_tree().get_root().add_child(firedbullet)
		$AudioStreamPlayer.play()
