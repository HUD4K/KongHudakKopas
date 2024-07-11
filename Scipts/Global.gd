extends Node
var score = 0
var lives = 2
var level

func isHurt():
	if (lives > 0):
		lives -= 1
		call_deferred("resetLevel")
	else:
		lives -= 1
		call_deferred("died")

func resetLevel():
	get_tree().reload_current_scene()
	
func died():
		get_tree().change_scene_to_file("res://Scenes/UI/Result_screen.tscn")
