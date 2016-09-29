
extends Node2D

export(NodePath) var Player_Initial_Flag

var player_current_flag

func _ready():
	set_process_input(true)
	
	get_node("Adilson").connect("stop_moving", self, "_player_stopped")
	
	# Setting player initial position
	get_node("Adilson").set_pos(get_node(Player_Initial_Flag).get_pos())
	player_current_flag = Player_Initial_Flag
	pass

func _input(event):
	if(event.type == InputEvent.KEY):
		# Player movement
		# spaghetti code yeey
		if(get_node("Adilson").is_moving == false):
			if(event.scancode == KEY_UP):
				var string_path = str(get_node(player_current_flag).Up).right(3)
				if string_path != "":
					var node = get_node("Flags/" + string_path)
					get_node("Adilson").move(node.get_pos())
					player_current_flag = NodePath("Flags/"+string_path)
					print("up")
			if(event.scancode == KEY_DOWN):
				var string_path = str(get_node(player_current_flag).Down).right(3)
				if string_path != "":
					var node = get_node("Flags/" + string_path)
					get_node("Adilson").move(node.get_pos())
					player_current_flag = NodePath("Flags/"+string_path)
					print("down")
			if(event.scancode == KEY_LEFT):
				var string_path = str(get_node(player_current_flag).Left).right(3)
				if string_path != "":
					var node = get_node("Flags/" + string_path)
					get_node("Adilson").move(node.get_pos())
					player_current_flag = NodePath("Flags/"+string_path)
					print("left")
			if(event.scancode == KEY_RIGHT):
				var string_path = str(get_node(player_current_flag).Right).right(3)
				if string_path != "":
					var node = get_node("Flags/" + string_path)
					get_node("Adilson").move(node.get_pos())
					player_current_flag = NodePath("Flags/"+string_path)
					print("right")

func _player_stopped():
	if get_node(player_current_flag).Quitanda:
		var node = get_node(player_current_flag).get_node(get_node(player_current_flag).Quitanda)
		if node:
			get_node("AnimationPlayer").play("quitanda")