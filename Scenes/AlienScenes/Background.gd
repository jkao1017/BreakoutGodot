extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var camera = $Camera2D/ScreenShake
var hello = rand_range(0,50)
# Called when the node enters the scene tree for the first time.
func _proces(delta):
	#hello += 1
	#if hello > 30:#$Boss/Boss.damage():
	camera.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
