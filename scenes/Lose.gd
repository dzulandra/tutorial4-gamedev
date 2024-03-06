extends Area2D

export var sceneName: String = "Level1"
export var delayTime: float = 6.0  # Delay time in seconds
export var musicToPlay: AudioStream 
signal scene_change_complete
 # Assign the music you want to play in the Inspector

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		# Play music
		if $AudioPlayer:
			$AudioPlayer.play()
			emit_signal("scene_change_complete")
		# Wait for the specified delay time
			yield(get_tree().create_timer(delayTime), "timeout")
		# Change the scene
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
