extends KinematicBody2D


onready var colisao_frente = $mao/hit_box_crab_frente
onready var colisao_atras = $mao/hit_box_crab_atras
onready var timer = $Timer
onready var cleito = get_node("/root/batalha_final/Cleito")

var speed = 100
var vida = 0
var tataque = 0.2
var dataque = 150


func _ready():
	timer.wait_time = tataque
	timer.start()

func hit():
	vida = vida + 1
	print(vida)

onready var anim = $AnimatedSprite

func _physics_process(delta):		
	var dist = position.distance_to(cleito.position)
	var vel = (cleito.position - position).normalized()
	if dist > dataque:
		anim.set_animation("movimenta")
		move_and_slide(vel * speed)
	elif dist <= dataque:
		move_and_slide(vel * 0)
		
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

func _on_Timer_timeout():
	# Se eu estou a menos q a distância de ataque, o inimigo gera dano no player
	var dist2 = position.distance_to(cleito.position)
	if dist2 <= dataque:
		anim.set_animation("ataque_baixo")
			
