extends Node2D

signal hit

@onready var doll = $doll

func _ready():
	doll.hero = self
	
func switch_pause():
	doll.pause()
	
func collide():
	Global.highscore()
	doll.pause()
	hit.emit()
