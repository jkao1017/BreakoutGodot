extends RigidBody2D

signal life_change(ball)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEEDUP = 500
const MAXSPEED = 30000
var max_lives: int = 3
var lives: float = max_lives
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("life_changed", get_parent().get_node("UI/Lives"),"on_plater_life_changed")
	emit_signal("life_changed",max_lives)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("bricks"):
			get_node("/root/World").score += 1
			body.queue_free()
			
			$Bounce.play()
		
		if body.is_in_group("walls"):
			$Bounce.play()
			
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = position - body.get_node("Position2D").get_global_position()
			#var velocity = direction.normalized() * min(speed+SPEEDUP*delta, MAXSPEED*delta)
			var velocity = direction.normalized() * 200
			set_linear_velocity(velocity)
			
			$Bounce.play()
	
	if get_position().y > get_viewport_rect().end.y:
		print("Ball is Dead")
		get_tree().reload_current_scene()
		lives -1
		emit_signal("life_change", lives)
		queue_free()
	if lives <0:
		print("GAME OVER")
