extends Node2D

@onready var pause_menu: CanvasLayer = $UI/PauseMenu

var isPaused = false

func _ready() -> void:
	var player = $World/Player
	var camera = $World/Camera2D
	player.position = get_viewport_rect().size / 2
	camera.position = player.position
	pause_menu.resume_game.connect(_resume_game)


func _physics_process(delta: float) -> void:
	var player = $World/Player
	var camera = $World/Camera2D
	camera.position = player.position
	if Input.is_action_just_pressed("ui_cancel") and not isPaused:
		_pause_game()

func _pause_game()->void:
		print("Pausing game")
		var camera = $World/Camera2D
		pause_menu.visible = true
		get_tree().paused = true
		isPaused = true

func _resume_game()->void:
		pause_menu.visible = false
		get_tree().paused = false
		isPaused = false
