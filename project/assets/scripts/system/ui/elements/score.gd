extends Control

@onready var current: Label = $back/label

func _ready():
	set_score()

func _reset_score():
	Global.reset()
	set_score()

func set_score():
	current.text = Global.get_score_string()

func append(bonus: int):
	Global.append_score(bonus)
	set_score()
