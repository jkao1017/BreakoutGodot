extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0 setget set_score
	
func set_score(value):
	score = value
	get_node("score").set_text("Score: " + str(score))
