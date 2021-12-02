extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Buttons/CloneButton.grab_focus()
		
	for button in $Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
		
func _process(delta):
	if Input.is_action_pressed("ui_down"):
		$AudioStreamPlayer.play()
	if Input.is_action_pressed("ui_up"):
		$AudioStreamPlayer.play()
	if Input.is_action_pressed("ui_accept"):
		$AudioStreamPlayer.play()
func _on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
