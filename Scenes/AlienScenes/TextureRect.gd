extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var camera = $Camera2D/ScreenShake

# Called when the node enters the scene tree for the first time.
func _proces(delta):

	camera.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

