extends Area2D

@export var bonus: int = 1

func _on_receive(hero: CollisionObject2D):
	hero.score.append(bonus)
	hero.hide_by_flue()
