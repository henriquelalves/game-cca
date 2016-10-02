
extends Control

func invert_sprite():
	set_scale(Vector2(-1.0,1.0))

func _ready():
	print("oi")
	add_user_signal("Quitanda_small_pressed")
	get_node("TextureButton").connect("pressed", self, "_pressed")

func _pressed():
	emit_signal("Quitanda_small_pressed")
	