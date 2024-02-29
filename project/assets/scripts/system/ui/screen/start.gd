extends ColorRect

@export_file(".tscn") var scene = "res://assets/scenes/main.tscn"

func _ready():
	#Stop a very short time to trigger UI changes
	await get_tree().create_timer(0.2).timeout
	
func load_scene():
	get_tree().change_scene_to_file(scene)
