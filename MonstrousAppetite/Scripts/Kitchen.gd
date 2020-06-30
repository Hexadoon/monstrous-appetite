extends Node

export var round_length = 300 # Length of round in seconds
var max_ingredient_count = 3 # Difficulty, essentially
var time_elapsed

var light_status = 0 # 0 is off, 1 is brightening, 2 is dimming
var light_cycle_count = 0 # Number of bright-dim cycles left

func _ready():
	time_elapsed = 0
	$RoundTimer.start()
	$OrderTimer.start()
	$HUD.update_timer(300)
	$HUD/TimerLabel.show()
	$Player.start($StartPos.position)

func _process(delta):
	if $NotebookLight.energy == 0:
		light_status = 0
	if light_cycle_count > 0 and light_status == 0:
		light_cycle_count -= 1
		light_status = 1
	if $NotebookLight.energy == 2:
		light_status = 2
	if light_status == 1:
		$NotebookLight.energy = clamp($NotebookLight.energy + (4 * delta), 0, 2)
	if light_status == 2:
		$NotebookLight.energy = clamp($NotebookLight.energy - (4 * delta), 0, 2)

func _on_RoundTimer_timeout():
	time_elapsed += 1
	$HUD.update_timer(300 - time_elapsed)
	if time_elapsed == round_length:
		get_parent().switch_scene("GameOver")

func _on_OrderTimer_timeout():
	randomize()
	var new_delay = floor(rand_range(10, 25))
	print(new_delay)
	$OrderTimer.wait_time = new_delay
	$OrderTimer.start()
#	OS.alert("next order in " + str(new_delay) + " seconds!", "New order!")
	var ing_count = randi() % max_ingredient_count
	print(ing_count)
	$Notebook.add_order(ing_count)
	light_cycle_count = 3

func show_notebook():
	$Notebook.show()
	$HUD.hide()

func show_HUD():
	$HUD.show()

func free_self():
	queue_free()
