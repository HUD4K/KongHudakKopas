extends AnimatableBody2D

func _on_area_2d_area_entered(area):
	if (area.name == "Hitbox"):
		Global.isHurt()
