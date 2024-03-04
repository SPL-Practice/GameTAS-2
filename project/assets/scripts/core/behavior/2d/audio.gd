extends Node

var current: int = 0
var explosion_type = "out"

@onready var score = [
	$score/small,
	$score/large
]

@onready var explosion = {
	"in" : $explosion/in,
	"out" : $explosion/out
}

func pickup_score():
	score[current].play()
	current = (current + 1) % score.size()

func explode():
	explosion[explosion_type].play()
