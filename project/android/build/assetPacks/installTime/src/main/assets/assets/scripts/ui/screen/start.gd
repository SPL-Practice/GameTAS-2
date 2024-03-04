extends ColorRect

@export_file(".tscn") var scene = "res://assets/scenes/main.tscn"

func load_scene():
	get_tree().change_scene_to_file(scene)

func _await_ui_changes():
	await get_tree().create_timer(0.2).timeout

func _ready():
	_await_ui_changes()
