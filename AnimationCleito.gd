extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var cleito = get_node("/root/batalha_final/Cleito")
#onready var cleito = get_node("/root/batalha_final/Cleito")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(hit):
	if Global.cleito_vida >= 0:
		print("teste")
		cleito.bloqueio = 0
