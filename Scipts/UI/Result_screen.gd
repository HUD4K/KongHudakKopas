extends Node

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
