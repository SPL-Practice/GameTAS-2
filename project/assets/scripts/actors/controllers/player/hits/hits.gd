extends Node2D

@onready var flue = $flue
@onready var warp = $warp

@onready var duration = $timings/flue
@onready var problem = $timings/warp

func _ready():
	warp.set_process(false)
	printerr("THROW!!")
	duration.start()

func _activate_flue():
	printerr("THROW!!")
	warp.process_mode = Node.PROCESS_MODE_DISABLED
	flue.process_mode = Node.PROCESS_MODE_INHERIT
	problem.stop()
	duration.start()
	
func _deactivate_flue():
	printerr("STOP!!")
	flue.process_mode = Node.PROCESS_MODE_DISABLED
	warp.process_mode = Node.PROCESS_MODE_INHERIT
	duration.stop()
	problem.start()
