
extends Node2D

export(NodePath) var Player_Initial_Flag

var player_current_flag

func Quitanda_small_pressed():
	print("oi")
	get_node("AnimationPlayer").play("quitanda")

func _ready():
	randomize()
	set_process_input(true)
	
	get_node("Adilson").connect("stop_moving", self, "_player_stopped")
	
	# Setting Quitanda
	var possible_flags = get_tree().get_nodes_in_group("Quitanda_flag")
	var random_flag = possible_flags[randi()%possible_flags.size()]
	print(random_flag)
	var Quitander = load("res://scenes/Quitanda-small.tscn")
	var Quitanda = Quitander.instance()
	Quitanda.set_pos(random_flag.get_pos())
	random_flag.is_Quitanda = true
	if(random_flag.invert_Quitanda):
		Quitanda.invert_sprite()
	get_node("Background").add_child(Quitanda)
	Quitanda.connect("Quitanda_small_pressed", self, "Quitanda_small_pressed")
	
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
	if get_node(player_current_flag).is_Quitanda:
		get_node("AnimationPlayer").play("quitanda")