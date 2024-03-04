extends AnimatableBody2D

signal hit

@export var score_path: String
@onready var animation = $animation
@onready var view = $view
@onready var explosion = $explosion
@onready var audio = $audio

var score
var doll
var is_freezed = false


func _ready():
	score = get_node(score_path)

func pin(freeze: bool): 
	is_freezed = freeze

func stop(full: bool):
	animation.stop(full)
	if (is_freezed):
		pin(false)

func play():
	if (is_freezed):
		return
	doll.santa.play("default")
	animation.play("player_present_falling_down")
	pin(true)

func _animation_end():
	doll.reset()
	stop(true)

func collide():
	hit.emit()
	audio.explosion_type = "out"
	
	
func hide_by_flue():
	view.hide()
	explosion.hide()
	audio.explosion_type = "in"
	audio.pickup_score()
