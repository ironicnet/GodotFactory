extends Node
var timer;
func _init():
	print('Game manager init')
func _ready():
	print('Game manager Ready')
	timer = Timer.new()
	timer.set_one_shot(false)
	timer.set_timer_process_mode(timer.TIMER_PROCESS_FIXED)
	timer.set_wait_time(1)
	timer.connect("timeout", self, "_timer_callback")
	timer.start()
	pass

func _timer_callback():
	print('Callback game manager')
	emit_signal("work_step")
