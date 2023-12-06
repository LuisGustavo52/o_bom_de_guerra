extends Label

onready var hud = get_node("/root/Hud/Vida_crab")

func _process(delta : float) -> void:
	if Global.fase == 3:
		hud.visible = true
	if Global.crab_vida == 0:
		text = String("morto")
	else:
		text = String(Global.crab_vida)
