extends Node

func _ready():
	Global.level = get_tree().get_current_scene().get_name()
