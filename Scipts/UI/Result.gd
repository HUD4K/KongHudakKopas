extends Label

func _ready():
	if (Global.lives >= 1):
		self.text = "YOU WIN!"
	else:
		self.text = "YOU LOST!"
