extends KinematicBody2D

export var speed = 150
export var direction = -1
var velocity = Vector2()
var sceneName = "LoseScreen"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = speed*direction*delta
	move_and_slide(velocity, Vector2.UP)
	var collision = move_and_collide(velocity)
	if collision:
		if $Sprite.flip_h:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
		direction *= -1

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
	else:
		body.queue_free() # Replace with function body.
