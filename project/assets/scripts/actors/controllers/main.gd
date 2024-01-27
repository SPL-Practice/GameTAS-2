extends Node

@onready var blocks = $blocks

func _process(_delta):
	blocks.progress();
