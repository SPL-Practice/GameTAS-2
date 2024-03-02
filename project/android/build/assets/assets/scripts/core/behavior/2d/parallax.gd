extends ParallaxLayer

@export var speed: float = 15

func _physics_process(delta):
	self.motion_offset.x += delta * speed
