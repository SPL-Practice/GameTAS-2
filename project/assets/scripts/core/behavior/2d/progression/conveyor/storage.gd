extends Node2D

var total_offset: float = 0
# Storage controls rendering scene nodes
var rendering: Array[Node2D] = []
# Element pointers: previous, current
var head: Vector2i
var flow: Vector2i

func set_elements_offset():
	total_offset = rendering[head.y].position.x

func add_elements_offset_size():
	total_offset += rendering[head.y].get_center()

func target_start_block():
	head = Vector2i(flow.y - 1, 0)

func target_last_block():
	head = Vector2i(0, flow.y - 1)

func next_element():
	var next = get_next_head()
	head.x = head.y
	head.y = next

func get_next_head() -> int:
	var next = head.y + flow.x
	if next < 0:
		next = flow.y - 1
	else:
		next = next % flow.y
	return next

func get_current():
	return rendering[head.y]
	
func get_previous():
	return rendering[head.x]

func get_first():
	return rendering[0]

func get_opposite_direction():
	return -flow.x

func push_block(block):
	block.name = block.name + "_" + str(flow.y)
	add_child(block)
	rendering.push_front(block)
	flow.y += 1
	
func push_front_block(block, target, interval: float):
	block.push_to_edge(target, interval)
	push_block(block)
