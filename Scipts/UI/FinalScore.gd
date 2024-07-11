extends Label

func _ready():
	self.text = "Lives left - " + str(Global.lives +1 ) + "\n" + \
				"Score - " + str(Global.score)
