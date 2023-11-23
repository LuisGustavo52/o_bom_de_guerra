extends KinematicBody2D

var hit = 0
onready var colisao_frente = $mao/hit_box_crab_frente
onready var colisao_atras = $mao/hit_box_crab_atras

func hit():
	hit = hit + 1
	print(hit)

onready var anim = $AnimatedSprite

func _physics_process(delta):		
	if (anim.get_animation() == "ataque_cima" ):
		if (anim.get_frame() == 2):
			colisao_frente.set_deferred("disabled", false)
	elif (anim.get_animation() == "ataque_baixo"):
		if (anim.get_frame() == 2):
			colisao_frente.set_deferred("disabled", false)


