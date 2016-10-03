
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process_input(true)
	pass

func _input(event):
	if(event.type == InputEvent.KEY):
		get_node("Feira").started = true
		get_node("Screen").hide()

