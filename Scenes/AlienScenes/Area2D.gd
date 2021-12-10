extends Area2D


func _process(delta):
	position.y += 1
	

		


func _on_Area2D_body_entered(body):
	if body.name == "Ship":
		Livecounter.lives -= 1
		queue_free()
	if body.name == "bullet":
		queue_free()
