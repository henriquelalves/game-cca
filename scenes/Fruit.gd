extends Node2D

var which_fruit = ""

func _ready():
	add_user_signal("pressed")
	get_node("Sprite").connect("pressed", self, "_pressed")
	pass

func _pressed():
	print("foi")
	emit_signal("pressed", self)

