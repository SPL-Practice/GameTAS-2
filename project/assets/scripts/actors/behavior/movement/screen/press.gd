extends "res://addons/godot-behavior-tree-plugin/action.gd"

var game

func send(tact):
	var state = FAILED
	var data = tact.blackboard
	var is_sent = data.get_value('present')
	
	if (!is_sent):
		printerr("YES")
		data.set_value('present', true)
		tact.actor.view.play()
		state = OK
	
	return state


func tick(tact: Tick):
	if (Input.is_action_just_pressed("confirm")):
		return send(tact)
	
	if (Input.is_action_just_pressed("jump")):
		return send(tact)
		
	return FAILED
