extends Area2D

@onready var flue = $flue
@onready var warp = $warp
@onready var view = $view

func _reactivate(to_disable, to_enable):
	to_disable.process_mode = Node.PROCESS_MODE_DISABLED
	to_enable.process_mode = Node.PROCESS_MODE_INHERIT

func _activate_flue():
	view.show()
	_reactivate(warp, flue)
	
func _deactivate_flue():
	view.hide()
	_reactivate(flue, warp)
