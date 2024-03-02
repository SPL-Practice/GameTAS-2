extends Node

var score: int
var max_score: int = 999

func _ready() -> void:
	reset()
	randomize()

func get_score_string() -> String:
	return str(score)

func append_score(bonus: int) -> void:
	score += bonus

func reset() -> void:
	score = 0
