extends Node2D


# Drawing far for: air, forest, houses
@export var drawing_far: Vector3i = Vector3i(6, 2, 4)

# Drawing speed for: air, forest, houses
@export var conveyor_speed: Vector3i = Vector3i(6, 2, 4)

@onready var air = $air
@onready var forest = $forest
@onready var houses = $houses

func fill_space() -> void:
	air.fill_space(drawing_far.x)
	forest.fill_space(drawing_far.y)
	houses.fill_space(drawing_far.z)

func progress() -> void:
	air.progress(conveyor_speed.x)
	forest.progress(conveyor_speed.y)
	houses.progress(conveyor_speed.z)
	
