extends Parallax2D


func _ready() -> void:
	var viewport_width = get_viewport_rect().size.x
	var parallax_layers = get_children()
	var texture_width = parallax_layers[0].texture.get_width()
	repeat_times = ceil(viewport_width *2 / texture_width) + 1
	screen_offset.x = viewport_width / 2
