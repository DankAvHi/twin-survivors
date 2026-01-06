extends Button

func _on_pressed() -> void:
	$"../../../SettingsScreen".hide()
	$"../../../MainScreen".show()
