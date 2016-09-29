
extends Control

export(String) var Quitanda_Name = ""

func _ready():
	print("oi")
	get_node("TextureButton").connect("pressed", self, "_pressed")

func _pressed():
	get_tree().change_scene("res://scenes/"+Quitanda_Name+".tscn")