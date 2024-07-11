extends Node2D
var groundCount = 0

func _ready():
	Global.level = get_tree().get_current_scene().get_name()

func _process(_delta):
	if (groundCount == 8):
		get_tree().change_scene_to_file("res://Scenes/UI/result_screen.tscn")
		
func _on_destroy_check_area_exited(area):
	if (area.name == "Hitbox"):
		groundCount += 1
