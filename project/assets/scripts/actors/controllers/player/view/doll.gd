extends Node2D

signal hit

var is_paused: bool = true

@onready var view = $present
@onready var blackboard = $blackboard
@onready var movement = $movement

func _input(e):
	blackboard.set_value('event', e)
	movement.tick(self, blackboard)

func _ready():
	view.doll = self
	blackboard.set_value('event', null)
	#blackboard.set_value('swipe', 'swiped')
	#blackboard.set_value('drag', false)
	#blackboard.set_value('present', false)
	reset()
	
func reset():
	blackboard.set_value('present', false)
	printerr("RESET")

func pause():
	if (is_paused):
		view.stop(false)
	else:
		view.play()
	
	is_paused = !is_paused
