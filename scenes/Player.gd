extends KinematicBody2D

const UP = Vector2(0, -1)

export var speed: int = 400
export var GRAVITY: int = 1200
export var jump_speed: int = -400
var can_move:bool = true

var velocity: Vector2 = Vector2()

func _ready():
	var level1_node = get_parent()
	level1_node.connect("scene_change_complete", self, "_on_scene_change_complete")

func get_input():
	velocity.x = 0
	if can_move:
		if is_on_floor() and Input.is_action_just_pressed("jump"):
			velocity.y = jump_speed
		if Input.is_action_pressed("ui_right"):
			velocity.x += speed
		if Input.is_action_pressed("ui_left"):
			velocity.x -= speed

func _physics_process(_delta):
	velocity.y += _delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)

func _process(_delta):
	if velocity.y != 0:
		$Animator.play("Jump")
	elif velocity.x != 0:
		$Animator.play("Walk")
		if velocity.x > 0:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	else:
		$Animator.play("Idle")

func _on_scene_change_complete():
	$AudioStreamPlayer2D.stop()
	can_move = false
	velocity = Vector2()
