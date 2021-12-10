extends Area2D


func _ready():
	
	var menu_pressed_clone = get_tree().get_root().find_node("AlienWorld",true,false)
	menu_pressed_clone.connect("menu_pressed_alien", self, "handleMenuAlien")

func _process(delta):
	position.y += 1
	

		


func _on_Area2D_body_entered(body):
	if body.name == "Ship":
		Livecounter.lives -= 1
		queue_free()
	if body.name == "bullet":
		queue_free()

func handleMenuAlien():
	queue_free()
