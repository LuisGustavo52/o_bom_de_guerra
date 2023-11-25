extends KinematicBody2D


onready var colisao_frente = $mao/hit_box_crab_frente
onready var colisao_atras = $mao/hit_box_crab_atras
onready var timer = $Timer
onready var cleito = get_node("/root/Palacio/Cleito")

var speed = 240
var vida = 0
var tataque = 0.2
var dataque = 50
var dpers = 1000

func _ready():
	timer.wait_time = tataque
	timer.start()

func hit():
	vida = vida + 1
	print(vida)

onready var anim = $AnimatedSprite

func _physics_process(delta):		
	if (anim.get_animation() == "ataque_cima" ):
		if (anim.get_frame() == 2):
			colisao_frente.set_deferred("disabled", false)
		else:
			colisao_frente.set_deferred("disabled", true)
	elif (anim.get_animation() == "ataque_baixo"):
		if (anim.get_frame() == 2):
			colisao_atras.set_deferred("disabled", false)
		else:
			colisao_atras.set_deferred("disabled", true)


