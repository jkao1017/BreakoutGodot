extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move_speed = 10
var shootingcount = rand_range(0,50)

signal my_signal

onready var damage_animation = $AnimationPlayer
onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()
func _process(delta):
	
	
	shootingcount = rand_range(0,50)
	
	
	#print(Livecounter.alienBallCount)
	if Livecounter.alienBallCount < Livecounter.alienBallLimit and Livecounter.alienBallCount >= 0:
		var ball_scene = preload("res://MiniScenes/AlienBall.tscn")
		var ball = ball_scene.instance()
		ball.position = position+Vector2(320,150)
		ball.linear_velocity.x = rand_range(-180,180)
		
		get_tree().get_root().add_child(ball)
		Livecounter.alienBallCount += 1
		
		_on_Timer_timeout()
	
		

		
func damage():
	
	
	$AudioStreamPlayer2.play()
	damage_animation.play("damage")
	Livecounter.bossLives -= 1
	if(Livecounter.bossLives == 0):
		queue_free()
	emit_signal("my_signal")
	




func _on_Timer_timeout():
	if shootingcount >= 40:
		var bullet = preload("res://Scenes/AlienScenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x, position.y)
		get_tree().get_root().add_child(firedbullet)
		$AudioStreamPlayer.play()
	elif shootingcount >= 30:
		var bullet = preload("res://Scenes/AlienScenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x + 140, position.y)
		get_tree().get_root().add_child(firedbullet)	
		$AudioStreamPlayer.play()
	elif shootingcount >= 20:
		var bullet = preload("res://Scenes/AlienScenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x + -140, position.y)
		get_tree().get_root().add_child(firedbullet)	
		$AudioStreamPlayer.play()
	elif shootingcount >= 10:
		var bullet = preload("res://Scenes/AlienScenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x + 90, position.y)
		get_tree().get_root().add_child(firedbullet)
		$AudioStreamPlayer.play()
	else:
		var bullet = preload("res://Scenes/AlienScenes/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x-90, position.y)
		get_tree().get_root().add_child(firedbullet)
		$AudioStreamPlayer.play()



