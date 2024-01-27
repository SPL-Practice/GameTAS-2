extends Node2D

signal hit

var vision
@export var ui_path: String = "../ui"

@onready var doll = $doll

func _ready():
	vision = get_node(ui_path)
	doll.hero = self
	
func switch_pause():
	vision.pause()
	doll.pause()
	
func collide():
	Global.highscore()
	doll.pause()
	vision.game_over()
	hit.emit()
