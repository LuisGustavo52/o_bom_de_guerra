extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var crab = get_node("/root/batalha_final/DemonCrab")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_sprite_crab_animation_finished():
	if get_animation() == "hit":
		crab.morte = 0
		crab.parado = 0
