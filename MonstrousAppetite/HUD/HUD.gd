extends Node2D

func update_timer(time):
	$TimerLabel.text = "Time: " + str(time)

func _on_Button_pressed():
	get_parent().show_notebook()
