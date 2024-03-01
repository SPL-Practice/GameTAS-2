extends Node

# Progress blocks with defined interval
@export var interval: float = 0
@export var offset: float = 0

var storage
var generator
var compare

func set_direction(speed: float) -> void:
	if speed < 0:
		storage.flow.x = -1
		compare = func(x, edge): return x < edge
		storage.target_last_block()
	else:
		storage.flow.x = 1
		compare = func(x, edge): return x >= edge
		storage.target_start_block()
		storage.add_elements_offset_size()
		
	storage.set_elements_offset()
		

func _iterate() -> void:
	var current = storage.get_current()
	var previous = storage.get_previous()
	var direction = storage.get_opposite_direction()
	current.align_by_edge(previous, direction, interval)
	storage.next_element()

func _determine_scroll_end() -> void:
	var target = storage.get_current()
	var edge = storage.total_offset
	var x = target.position.x
	
	if compare.call(x, edge):
		_iterate()

func scroll(speed) -> void:
	for block in storage.rendering:
		block.position.x += speed

func progress(speed) -> void:
	_determine_scroll_end()
	scroll(speed)
