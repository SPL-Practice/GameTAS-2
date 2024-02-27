extends "res://addons/godot-behavior-tree-plugin/action.gd"

func dead_zone(x: float, y: float):
	var x_area = x >= 190 and x <= 700
	return x_area and y >= 3600 and y <= 4125

func tick(tact: Tick):
	var cursor = tact.blackboard.get_value('mouse')
	if dead_zone(cursor.x, cursor.y):
		return OK
		
	return FAILED
