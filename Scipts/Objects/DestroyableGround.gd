extends StaticBody2D

func _on_destroy_check_area_exited(area):
	if (area.name == "Hitbox"):
		queue_free()
