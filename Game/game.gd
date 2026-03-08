extends Node2D

@onready var pause_menu: CanvasLayer = $UI/PauseMenu
@onready var player = $World/Player
@onready var camera = $World/Camera2D
@onready var path2d = $World/Path2D

var isPaused = false
var spawn_timer = 0.0
const SPAWN_INTERVAL = 5.0

func _ready() -> void:
	player.position = get_viewport_rect().size / 2
	camera.position = player.position
	pause_menu.resume_game.connect(_resume_game)
	_spawn_enemies()

func _reposition_path2d():
	path2d.position = player.position - get_viewport_rect().size / 2

func _spawn_enemies():
	var enemy_scene = preload("res://Enemy/enemy.tscn")
	var curve_length = path2d.curve.get_baked_length()
	
	for i in range(5): 
		var enemy = enemy_scene.instantiate()
		var random_offset = randf() * curve_length
		enemy.position = path2d.curve.sample_baked(random_offset) + path2d.position
		enemy.target = player
		$World.add_child(enemy)

func _physics_process(delta: float) -> void:
	camera.position = player.position
	_reposition_path2d()
	
	spawn_timer += delta
	if spawn_timer >= SPAWN_INTERVAL:
		spawn_timer = 0.0
		_spawn_enemies()
	
	if Input.is_action_just_pressed("ui_cancel") and not isPaused:
		_pause_game()

func _pause_game()->void:
	print("Pausing game")
	pause_menu.visible = true
	get_tree().paused = true
	isPaused = true

func _resume_game()->void:
	pause_menu.visible = false
	get_tree().paused = false
	isPaused = false
