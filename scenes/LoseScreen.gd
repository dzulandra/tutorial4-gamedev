extends Node2D

const SCENE_TO_LOAD = "res://scenes/Level1.tscn"

func _input(event):
	# Check if any input event occurs
	if event.is_action_pressed("ui_accept"):
		# Load the new scene
		change_scene(SCENE_TO_LOAD)

# Function to change the scene
func change_scene(scene_path):
	# Load the new scene
	var new_scene = load(scene_path)
	
	# Change to the new scene
	get_tree().change_scene_to(new_scene)
