
extends Node2D

export(NodePath) var Up
export(NodePath) var Down
export(NodePath) var Left
export(NodePath) var Right

export(NodePath) var Quitanda

func _ready():
	get_node("TextureFrame").hide()
	pass

