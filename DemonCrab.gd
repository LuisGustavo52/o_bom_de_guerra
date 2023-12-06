extends KinematicBody2D


onready var colisao_frente = $mao/hit_box_crab_frente
onready var colisao_atras = $mao/hit_box_crab_atras
onready var timer = $Timer
onready var timer2 = $Timer2
onready var cleito = get_node("/root/batalha_final/Cleito")

var speed = 140
var tataque = 0.4
var dataque = 90
var parado = 0
var posicao_cleito = Vector2()
var posicao_crab = Vector2()
var morte = 0

func parado():
	colisao_frente.set_deferred("disabled", true)
	colisao_atras.set_deferred("disabled", true)
	anim.set_animation("parado")
	parado = 1
	
func _ready():
	parado()
	timer.wait_time = tataque
	timer2.wait_time = 5
	timer.start()

func morte():
	parado()
	anim.set_animation("morte")
	morte = 1
	
func hit():
	if morte == 0:
		anim.set_animation("hit")
		Global.set_crab_vida(1)
		if Global.crab_vida < 5:
			speed = 200
			tataque = 0.1
		if Global.crab_vida < 1:
			morte()
		morte = 1
		parado = 1

onready var anim = $sprite_crab

func _physics_process(delta):		
	var dist = position.distance_to(cleito.position)
	var vel = (cleito.position - position).normalized()
	if morte == 0 and parado == 0:
		if dist > dataque:
			colisao_frente.set_deferred("disabled", true)
			colisao_atras.set_deferred("disabled", true)
			anim.set_animation("movimenta")
			move_and_slide(vel * speed)
		elif dist <= dataque:
			move_and_slide(vel * 0)
			#anim.set_animation("parado")
			
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
	if dist2 <= dataque and parado == 0:
		posicao_cleito = cleito.position
		posicao_crab = position
		
		if posicao_cleito.y - posicao_crab.y > 0:
			anim.set_animation("ataque_baixo")
		else:
			anim.set_animation("ataque_cima")

func _on_Timer2_timeout():
	pass
	#if Global.cleito_vida < 1:
		#Global.set_crab_vida(15)
		#Global.set_cleito_vida(3)
		#get_tree().reload_current_scene()
