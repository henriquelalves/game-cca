
extends Control

export(NodePath) var Quitanda_Name

func _ready():
	print("oi")
	get_node("TextureButton").connect("pressed", self, "_pressed")

func _pressed():
	if(Quitanda_Name != ""):
		get_tree().change_scene("res://scenes/"+Quitanda_Name+".tscn")