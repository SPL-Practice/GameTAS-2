extends Node2D

@export var drawing_far: int = 5
@export var conveyor_speed: float = -7
@onready var houses = $houses

func fill_space() -> void:
	houses.fill_space(drawing_far, conveyor_speed)

func progress() -> void:
	houses.progress(conveyor_speed)
