extends Area2D

@export var bonus: int = 1
@export var switcher_path: String = "../switcher"

var switcher

func _ready():
	switcher = get_node(switcher_path)

func _on_receive(hero: CollisionObject2D):
	printerr("YEEES")
	hero.score.append(bonus)
	switcher.switch()
