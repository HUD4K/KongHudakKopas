extends Area2D

func _on_area_entered(area):
	if (area.name == "Hitbox"):
		Global.isHurt()
