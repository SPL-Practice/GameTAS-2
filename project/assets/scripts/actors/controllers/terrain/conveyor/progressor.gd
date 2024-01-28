extends Node

# Progress blocks with defined interval
@export var interval: float = 0
@export var offset: float = 0

var storage
var generator

func last_blocks() -> void:
	var last = storage.get_last()
	var block = generator.generate()
	storage.append_block(block, last, interval)
	
func first_blocks() -> void:
	var first = storage.get_first()
	var block = generator.generate()
	storage.push_front_block(block, first, interval)

func first_bounds() -> void:
	var first = storage.get_first()
	var edge = first.get_center() + offset
	
	if first.position.x > edge:
		storage.drop_front()
		last_blocks()
		
func last_bounds() -> void:
	var last = storage.get_last()
	var edge = last.get_center() + offset
	
	if last.position.x < edge:
		storage.drop_back()
		first_blocks()

func check_out_of_bounds(speed) -> void:
	if (speed > 0):
		first_bounds()
	else:
		last_bounds()

func progress(speed) -> void:
	check_out_of_bounds(speed)
	for block in storage.rendering:
		block.position.x += speed
