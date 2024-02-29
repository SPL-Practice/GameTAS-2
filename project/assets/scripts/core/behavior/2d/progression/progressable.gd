extends Node2D

var view: get = get_view

func get_view():
	if (view == null):
		view = $view
	return view

func get_center():
	var width = view.get_rect().size.x
	return width * view.scale.x / 2
	
func append_to_edge(target: Node2D, interval: float) -> void:
	var x = target.position.x
	var center = target.get_center()
	var append = get_center()
	position.x = x - center - append - interval

func push_to_edge(target: Node2D, interval: float) -> void:
	var x = target.position.x
	var center = target.get_center()
	var append = get_center()
	position.x = x + center + append + interval
