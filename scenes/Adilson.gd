
extends Node2D

# Simple class to handle simple movement
onready var is_moving = false
onready var next_pos = Vector2(0.0, 0.0)
onready var velocity = 1.5
onready var porcentage = 0.0

func move(new_pos):
	next_pos = new_pos
	is_moving = true
	var vec = next_pos - get_pos()
	if(vec.x > 0):
		get_node("Sprite").set_flip_h(false)
		get_node("Particles2D").set_scale(Vector2(1.0,1.0))
	else:
		get_node("Sprite").set_flip_h(true)
		get_node("Particles2D").set_scale(Vector2(-1.0,1.0))
	get_node("AnimationPlayer").play("moving")

func _ready():
	set_fixed_process(true)
	add_user_signal("stop_moving")
	pass

func _fixed_process(delta):
	if(is_moving):
		var vector = (next_pos - get_pos()).normalized()*velocity
		if ((get_pos() + vector) - next_pos).length() < 1.1:
			set_pos(next_pos)
			is_moving = false
			emit_signal("stop_moving")
			get_node("AnimationPlayer").stop(true)
			return
		set_pos(get_pos() + vector)
