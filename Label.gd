extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta : float) -> void:
	if Global.cleito_vida < 0:
		text = String("morto")
	else:
		text = String(Global.cleito_vida)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
