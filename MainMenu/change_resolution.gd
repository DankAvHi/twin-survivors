extends OptionButton

const sizes = {
	0:Vector2i(1280,720),
	1:Vector2i(1920,1080)
}

func _on_window_size_changed()->void:
	var new_size = get_viewport().size
	for sizeKey in sizes.keys():
		var resolution = sizes.get(sizeKey)
		if(resolution == new_size):
			select(sizeKey)
			if(item_count>sizes.size()):
				remove_item(item_count-1)
			break
		else:
			add_item(str(new_size.x)+"x"+str(new_size.y))
			if(item_count>sizes.size()+1):
				remove_item(item_count-2)
			select(item_count-1)

func _ready() -> void:
	get_viewport().size_changed.connect(_on_window_size_changed)

func _on_item_selected(index: int) -> void:
	DisplayServer.window_set_size(sizes.get(index))
	if(item_count>sizes.size()):
		remove_item(item_count-1)
