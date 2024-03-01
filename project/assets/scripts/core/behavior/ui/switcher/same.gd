extends Node

@export var to_switch: CanvasItem
@export var switch_path: String

func _ready():
	if (to_switch == null):
		to_switch = get_node(switch_path)

func switch():
	to_switch.visible = !to_switch.visible
