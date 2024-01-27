extends Node2D

var view: get = get_view

func get_view():
	if (view == null):
		view = $view
	return view

func get_center():
	return view.texture.get_width() / 2
	
func append_to_edge(target: Node2D, interval: float) -> void:
	var y = target.position.y
	var center = target.get_center()
	var append = get_center()
	position.y = y - center - append - interval
