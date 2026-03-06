extends Label

var timer:Timer
var time = 1000 * 60 * 30
func _ready() -> void:
	timer = get_node("../Timer")

func _convert_milliseconds_to_time_string(milliseconds: int) -> String:
	var seconds = (milliseconds / 1000) % 60
	var minutes = (milliseconds / (1000 * 60)) % 60
	return str(int(minutes)).pad_zeros(2) + ":" + str(int(seconds)).pad_zeros(2)

func _on_timer_timeout() -> void:
	time -= 1000
	text = _convert_milliseconds_to_time_string(time)
