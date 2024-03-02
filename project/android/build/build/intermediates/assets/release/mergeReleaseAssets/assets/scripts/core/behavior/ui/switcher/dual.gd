extends "res://assets/scripts/core/behavior/ui/switcher/single.gd"

func switch():
	super.switch()
	var hiding = to_show
	to_show = to_hide
	to_hide = hiding
