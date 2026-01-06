extends Button

func _on_pressed() -> void:
	$"../../../MainScreen".hide()
	$"../../../SettingsScreen".show()
