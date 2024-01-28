extends Node2D

@onready var flue = $flue
@onready var warp = $warp

@onready var duration = $timings/flue
@onready var problem = $timings/warp

func _activate_flue():
	
	duration.start()
	
func _deactivate_flue():
	problem.start()
