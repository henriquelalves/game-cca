
extends Node2D

export(NodePath) var Up
export(NodePath) var Down
export(NodePath) var Left
export(NodePath) var Right

export(bool) var Quitanda_possible
export(bool) var is_Quitanda
export(bool) var invert_Quitanda = false

func _ready():
	get_node("TextureFrame").hide()
	if(Quitanda_possible):
		add_to_group("Quitanda_flag")
		print("Oi")
	pass

