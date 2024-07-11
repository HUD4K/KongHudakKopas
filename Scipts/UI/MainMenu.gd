extends Node

func _on_25m_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/25m.tscn")
	Global.lives = 2

func _on_50m_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/50m.tscn")
	Global.lives = 2
	
func _on_75m_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/75m.tscn")
	Global.lives = 2

func _on_100m_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/100m.tscn")
	Global.lives = 2
	
func _on_quit_pressed():
	get_tree().quit()
