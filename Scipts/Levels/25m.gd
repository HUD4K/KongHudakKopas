extends Node
var barrel = preload("res://Scenes/Objects/Barrel.tscn")

func _ready():
	Global.level = get_tree().get_current_scene().get_name()
		
func _on_timer_timeout():
	var instance = barrel.instantiate()
	add_child(instance)
