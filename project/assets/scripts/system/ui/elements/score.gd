extends Control

@onready var current: Label = $back/label
@onready var exit = get_node("../exit")
@onready var pause = get_node("../pause")
@onready var stop = get_node("../../../break")

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
	if (Global.score >= Global.max_score):
		Global.highscore()
		pause.hide()
		exit.show()
		stop.server.on_receive.emit()
		Global.reset()
