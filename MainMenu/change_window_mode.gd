extends CheckButton

func _on_pressed() -> void:
	if(DisplayServer.window_get_mode() == 0):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		$"../ChangeResolutionContainer/ChangeResolution".disabled = true
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,false)
		$"../ChangeResolutionContainer/ChangeResolution".disabled = false
