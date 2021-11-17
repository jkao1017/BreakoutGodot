extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEEDUP = 400
const MAXSPEED = 30000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(delta)
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("bricks"):
			get_node("/root/World").score += 5
			body.queue_free()
			
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = position - body.get_node("Position2D").get_global_position()
			#var velocity = direction.normalized() * min(speed+SPEEDUP*delta, MAXSPEED*delta)
			var velocity = direction.normalized() * 200
			set_linear_velocity(velocity)
	
	if position.y > get_viewport_rect().end.y:
		queue_free()
