extends Node2D



func _ready():
	Livecounter.lives = 3

func _process(delta):
	if Livecounter.lives == 2:
		$Sprite3.texture = load("res://Sprites/lostlife.png")
	if Livecounter.lives == 1: 
		$Sprite2.texture = load("res://Sprites/lostlife.png")	
	if Livecounter.lives <= 0:
		$Sprite.texture = load("res://Sprites/lostlife.png")
		reset()
		get_tree().change_scene("res://Scenes/TitleScreen.tscn")
		
		

func reset():
	
	Livecounter.bossLives = 100
	Livecounter.lives = 3
	Livecounter.alienBallCount = 0
	Livecounter.alienBallLimit = 1	
	

