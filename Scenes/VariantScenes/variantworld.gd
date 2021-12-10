extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0 setget set_score
signal menu_pressed_variant
	
func _ready():

	$MenuButton.connect("pressed", self, "_on_Button_pressed", [$MenuButton.scene_to_load])

func _on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
	emit_signal("menu_pressed_variant")
	
func set_score(value):
	score = value
	get_node("score").set_text("Score: " + str(score))
	
	
