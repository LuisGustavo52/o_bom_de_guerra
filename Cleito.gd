extends KinematicBody2D
class_name Cleiton

var movimento = Vector2()
var ultimaAnimacao = 0
var bloqueio = 0
var velocidade = 175


onready var anim = $sprite_boneco/AnimationPlayer
onready var sprite = $sprite_boneco
onready var colisao = $colisao_boneco
onready var colisao_cima = $arma/colisao_arma_cima
onready var colisao_baixo = $arma/colisao_arma_baixo
onready var colisao_esquerda = $arma/colisao_arma_ladoL
onready var colisao_direita = $arma/colisao_arma_ladoR
onready var crab = get_node("/root/batalha_final/DemonCrab")



func desliga_ataque():
	colisao_cima.set_deferred("disabled", true)
	colisao_baixo.set_deferred("disabled", true)
	colisao_esquerda.set_deferred("disabled", true)
	colisao_direita.set_deferred("disabled", true)

func morre():
	bloqueio = 1
	anim.play("morte")
	colisao.set_deferred("disabled", true)
	crab.parado()
	crab.timer2.start()
	#get_tree().change_scene("res://OMEGA_PROJECT.tscn")

func hit_crab():
	anim.play("hit")
	bloqueio = 1
	print ("hit")
	if (Global.cleito_vida < 1):
		morre()
	Global.set_cleito_vida(1)
	print (Global.cleito_vida)
	
	
func _physics_process(delta):	
	if (bloqueio == 0):	
		if Input.is_action_pressed("attack"):
			if ultimaAnimacao == 1:
				movimento.x = 0
				movimento.y = 0
				anim.play("ataque_ladoR")
				sprite.flip_h = false
			elif ultimaAnimacao == 2:
				movimento.x = 0
				movimento.y = 0
				anim.play("ataque_ladoL")
				sprite.flip_h = true
			elif ultimaAnimacao == 3:
				movimento.x = 0
				movimento.y = 0
				anim.play("ataque_cima")
				sprite.flip_h = false
			else:
				movimento.x = 0
				movimento.y = 0
				anim.play("ataque_baixo")
				sprite.flip_h = false
		elif Input.is_action_pressed("ui_right"):
			desliga_ataque()
			movimento.x = velocidade
			anim.play("andando_lado")
			sprite.flip_h = false
			ultimaAnimacao = 1
		elif Input.is_action_pressed("ui_left"):
			desliga_ataque()
			movimento.x = -velocidade
			anim.play("andando_lado")
			sprite.flip_h = true
			ultimaAnimacao = 2
		elif Input.is_action_pressed("ui_up"):
			desliga_ataque()
			movimento.y = -velocidade
			anim.play("andando_cima")
			sprite.flip_h = false
			ultimaAnimacao = 3
		elif Input.is_action_pressed("ui_down"):
			desliga_ataque()
			movimento.y = velocidade
			anim.play("andando_baixo")
			sprite.flip_h = false
			ultimaAnimacao = 4
		else:
			desliga_ataque()
			movimento.x = 0
			movimento.y = 0
			if ultimaAnimacao == 1:
				anim.play("parado_lado")
				sprite.flip_h = false
			elif ultimaAnimacao == 2:
				anim.play("parado_lado")
				sprite.flip_h = true
			elif ultimaAnimacao == 3:
				anim.play("parado_cima")
				sprite.flip_h = false
			else:
				anim.play("parado_baixo")
				sprite.flip_h = false
				
			#Função de ataque
		
			
			
		movimento = move_and_slide(movimento)






func _on_Cleito_child_entered_tree(node):
	if Global.fase ==3:
		$Soundtrack1.stop()
		$Soundtrack2.play()
	else:
		$Soundtrack1.play()
