extends Parallax2D


var viewport_width: float
var texture_width: float
var parallax_layers: Array

func _recalculate_parallax():
	viewport_width = get_viewport_rect().size.x
	parallax_layers = get_children()
	texture_width = parallax_layers[0].texture.get_width()
	repeat_times = ceil(viewport_width *2 / texture_width) + 1
	screen_offset.x = viewport_width / 2

func _ready() -> void:
	get_viewport().size_changed.connect(_on_window_resized)
	_recalculate_parallax()

func _on_window_resized():
	_recalculate_parallax()
	
