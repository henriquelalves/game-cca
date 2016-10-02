extends Node2D


func _ready():
	randomize()
	# Get all possible fruits
	var dir = Directory.new()
	dir.open("res://assets/fruits/")
	dir.list_dir_begin()
	var file_name = dir.get_next()
	var possible_fruits = []
	while(file_name != ""):
		if(file_name != ".." and file_name != "."):
			possible_fruits.append(file_name)
		file_name = dir.get_next()
	# Connect stuff and set fruits
	for fruit in get_node("Fruits").get_children():
		fruit.connect("pressed", self, "fruit_pressed")
		var random_fruit_index = randi()%possible_fruits.size()
		fruit.which_fruit = possible_fruits[random_fruit_index]
		possible_fruits.remove(random_fruit_index)
		var texture = load("res://assets/fruits/" + fruit.which_fruit)
		fruit.get_node("Sprite").set_normal_texture(texture)
	
	# Connect back button
	get_node("back").connect("pressed", self, "back_pressed")
	pass

func fruit_pressed(fruit):
	get_node("Fruits").hide()
	get_node("Dinheiros").show()
	var value = ((randi()%8)+1.0)+((randi()%4)*0.25)
	get_node("Dinheiros").get_node("preco_label/dinheiros").set_text("%4.2f"%value)

func back_pressed():
	print("back_pressed")
	if(get_node("Fruits").is_visible()):
		get_tree().change_scene("res://scenes/Feira.tscn")
	else:
		get_node("Fruits").show()
		get_node("Dinheiros").hide()