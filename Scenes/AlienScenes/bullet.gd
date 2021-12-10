extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var bulletImpact : PackedScene

var MOVE_SPEED = 300
var life_time = 2
var life_spawn = 0

func _process(delta):
	var collision = move_and_collide(Vector2.UP * delta * MOVE_SPEED)
	
	
	if collision and collision.collider.has_method("damage"):
		collision.collider.damage()
		var impact = bulletImpact.instance() as Node2D
		get_parent().add_child(impact)
		impact.global_position = collision.position + Vector2(10,0)
		#get_tree().get_root().add_child(bulletImpact)
		
		queue_free()
		
	life_spawn += delta
	if life_spawn > life_time:
		 queue_free()

