extends Node2D

# Storage controls rendering scene nodes
var rendering: Array[Node2D] = []
var order = 0

func get_current(index: int):
	return rendering[index - 1]

func get_first():
	return rendering[0]
	
func get_last():
	return rendering[-1]

func drop_front():
	var first = rendering.pop_front()
	remove_child(first)
	first.queue_free()
	
func drop_back():
	var first = rendering.pop_back()
	remove_child(first)
	first.queue_free()

func add_block(block):
	block.name = block.name + "_" + str(order)
	add_child(block)
	rendering.append(block)
	order += 1
	
func push_block(block):
	block.name = block.name + "_" + str(order)
	add_child(block)
	rendering.push_front(block)
	order += 1

func push_front_block(block, current, offset: float):
	block.push_to_edge(current, offset)
	push_block(block)

func append_block(block, current, offset: float):
	block.append_to_edge(current, offset)
	add_block(block)
