extends AnimatableBody2D

signal hit

@onready var animation = $animation

var is_freezed = false

func pin(freeze: bool): 
	is_freezed = freeze

func stop(full: bool):
	animation.stop(full)
	if (is_freezed):
		pin(false)

func play():
	if (is_freezed):
		return
	animation.play()
	pin(true)

func collide():
	Global.highscore()
	stop(true)
	hit.emit()
