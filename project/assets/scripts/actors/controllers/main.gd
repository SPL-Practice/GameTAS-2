extends Node

@onready var blocks = $blocks

func _ready():
	blocks.fill_space();

func _physics_process(_delta):
	blocks.progress();
