extends StaticBody2D

func _process(_delta):
	if $CollisionShape2D.global_position.y > 233:
		position.y = position.y - 0.8
	else:
		$CollisionShape2D.global_position.y = 660
		$TextureRect.global_position.y = 641