extends HSlider

@export_range (0, 1, 0.01) var default_volume: float
@export var bus_name: String

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	_init()

func _init() -> void:
	value = default_volume
	_on_value_changed(default_volume)
	
func _on_value_changed(_value_to_change: float) -> void:
	var db: float = linear_to_db(value)
	AudioServer.set_bus_volume_db(bus_index, db)
