extends Area2D

@onready var flue = $flue
@onready var warp = $warp
@onready var view = $view

func _debug(to_disable, to_enable):
	to_disable.hide()
	to_enable.show()

func _reactivate(to_disable, to_enable):
	to_disable.process_mode = Node.PROCESS_MODE_DISABLED
	to_enable.process_mode = Node.PROCESS_MODE_INHERIT
	_debug(to_disable, to_enable)

func _activate_flue(_body):
	view.show()
	_reactivate(warp, flue)
	
func _deactivate_flue(_body):
	view.hide()
	_reactivate(flue, warp)
