extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hello = rand_range(0,50)
# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuButton.connect("pressed", self, "_on_Button_pressed", [$MenuButton.scene_to_load])
	var damaged = get_tree().get_root().find_node("Boss",true,false)
	damaged.connect("my_signal", self, "handleDamage")
	
func handleDamage():
	Livecounter.camera.shake(300,1,300)	

func _on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
