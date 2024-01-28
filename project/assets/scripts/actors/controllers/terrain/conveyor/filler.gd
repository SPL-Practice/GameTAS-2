extends Node

"""
Fills the worldspace with provided storage,
generator, offset and objects max count
"""

func fill_append(storage, generator, offset: Vector3i, count: int) -> void:
	for index in count:
		var block = generator.generate()
		
		if index == 0:
			var edge = block.get_center() + offset.x + offset.z
			block.position.x = edge
			storage.add_block(block)
		else:
			var current = storage.get_current(index)
			storage.append_block(block, current, offset.y)

var count1 = 0

func fill_push(storage, generator, offset: Vector3i, count: int) -> void:
	count1 += 1
	
	for index in count:
		var block = generator.generate()
		
		if index == 0:
			var edge = block.get_center() + offset.x + offset.z
			block.position.x = edge
			storage.push_block(block)
		else:
			var current = storage.get_first()
			storage.push_front_block(block, current, offset.y)
