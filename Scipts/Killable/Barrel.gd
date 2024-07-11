extends RigidBody2D
var droppable = false

func _on_area_2d_area_entered(area):
	if (area.name == "Hitbox"):
		Global.isHurt()
	elif ("BarrelDropSpot" in area.name):
		var shouldDrop = randf()
		if(shouldDrop < 0.2):
			droppable = true
	elif (area.name == "ScoreCounter"):
		Global.score += 100
			
func _on_area_2d_area_exited(area):
	if ("BarrelDropSpot" in area.name):
		droppable = false

func _on_area_2d_body_entered(body):
	if (body.name == "BarrelDespawner"):
			queue_free()

func _integrate_forces(_state):
	if (droppable == true):
		gravity_scale = 0
		linear_velocity.x = 0
		call_deferred("drop")
		await get_tree().create_timer(0.5).timeout
		lock_rotation = false
		gravity_scale = 20

func drop():
	for i in range(2):
		position.y = position.y + 1
		await get_tree().create_timer(0.2).timeout
	lock_rotation = true
