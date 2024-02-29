extends Node2D

signal hit
var is_paused: bool = true

@onready var santa = $santa
@onready var view = $santa/present/body
@onready var blackboard = $blackboard
@onready var movement = $movement

func _set_input(e) -> void:
	blackboard.set_value('event', e)
	blackboard.set_value('cursor', get_global_mouse_position())

func reset():
	blackboard.set_value('present', false)

func _input(e) -> void:
	_set_input(e)
	movement.tick(self, blackboard)

func _ready():
	view.doll = self
	_set_input(null)
	reset()

func pause():
	if (is_paused):
		view.stop(false)
	else:
		view.play()
	is_paused = !is_paused
