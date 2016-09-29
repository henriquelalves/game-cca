extends Node2D

func _ready():
	get_node("Sprite").connect("pressed", self, "_pressed")
	pass

func _pressed():
	print("foi")

