extends Node2D

var hero: Node2D
var is_paused: bool = true

@onready var view = $present
@onready var blackboard = $blackboard
@onready var movement = $movement

func _input(e):
	blackboard.set_value('event', e)
	movement.tick(hero, blackboard)

func _ready():
	blackboard.set_value('swipe', 'swiped')
	blackboard.set_value('drag', false)
	blackboard.set_value('event', null)

func pause():
	if (is_paused):
		view.stop(true)
	else:
		view.play()
	
	is_paused = !is_paused
