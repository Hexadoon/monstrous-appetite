extends Node

export var round_length = 10 # Length of round in seconds
var time_elapsed

func _ready():
	time_elapsed = 0
	$RoundTimer.start()
	$OrderTimer.start()
	$HUD.update_timer(300)
	$HUD/TimerLabel.show()
	$Player.start($StartPos.position)

func _on_RoundTimer_timeout():
	time_elapsed += 1
	$HUD.update_timer(300 - time_elapsed)
	
	if time_elapsed == round_length:
		get_parent().switch_scene("GameOver")

func _on_OrderTimer_timeout():
	var new_delay = floor(rand_range(10, 25))
	$OrderTimer.wait_time = new_delay
	$OrderTimer.start()
	OS.alert("next order in " + str(new_delay) + " seconds!", "New order!")

func free_self():
	queue_free()
