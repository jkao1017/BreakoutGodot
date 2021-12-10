extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEEDUP = 400
const MAXSPEED = 30000
export var bulletImpact : PackedScene

func _ready():
	var menu_pressed_clone = get_tree().get_root().find_node("AlienWorld",true,false)
	menu_pressed_clone.connect("menu_pressed_alien", self, "handleMenuAlien")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:

		#if body.is_in_group("walls"):
			#$Bounce.play()
		if body.get_name() == "Boss":
			var impact = bulletImpact.instance() as Node2D
			get_parent().add_child(impact)
			impact.global_position = position + Vector2(10,0)
			body.damage()
			
		if body.get_name() == "Ship":
			
			var speed = get_linear_velocity().length()
			var direction = position - body.get_node("Position2D").get_global_position()
			#var velocity = direction.normalized() * min(speed+SPEEDUP*delta, MAXSPEED*delta)
			var velocity = direction.normalized() * 200
			set_linear_velocity(velocity)
			
			
	
	if position.y > OS.get_window_size().y:
		Livecounter.alienBallCount -= 1
		Livecounter.lives -= 1
		queue_free()
		if Livecounter.alienBallCount < 0:
			Livecounter.alienBallCount = 0
	
	if position.y < 0:
		Livecounter.alienBallCount -= 1
		queue_free()
		if Livecounter.alienBallCount < 0:
			Livecounter.alienBallCount = 0
		
func handleMenuAlien():
	Livecounter.alienBallCount -=1
	queue_free()	
