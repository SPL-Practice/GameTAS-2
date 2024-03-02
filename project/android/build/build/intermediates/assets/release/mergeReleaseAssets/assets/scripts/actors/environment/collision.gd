extends Area2D

@onready var timing = get_parent()

func _on_player_collide(body):
	body.collide()
