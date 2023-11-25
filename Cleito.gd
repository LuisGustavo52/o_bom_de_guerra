extends KinematicBody2D

var movimento = Vector2()
var ultimaAnimacao = 0
var vida = 3
var morto = 0
var velocidade = 175

onready var anim = $sprite_boneco/AnimationPlayer
onready var sprite = $sprite_boneco
onready var colisao = $colisao_boneco

func morre():
	morto = 1
	anim.play("morte")
	colisao.set_deferred("disabled", true)
	#get_tree().change_scene("res://OMEGA_PROJECT.tscn")

func hit_crab():
	print ("hit")
	if (vida < 1):
		morre()
	vida -= 1
	print (vida)
	
	

func ataque(var direcao):
	pass

func _physics_process(delta):	
	if (morto == 0):	
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
			movimento.x = velocidade
			anim.play("andando_lado")
			sprite.flip_h = false
			ultimaAnimacao = 1
		elif Input.is_action_pressed("ui_left"):
			movimento.x = -velocidade
			anim.play("andando_lado")
			sprite.flip_h = true
			ultimaAnimacao = 2
		elif Input.is_action_pressed("ui_up"):
			movimento.y = -velocidade
			anim.play("andando_cima")
			sprite.flip_h = false
			ultimaAnimacao = 3
		elif Input.is_action_pressed("ui_down"):
			movimento.y = velocidade
			anim.play("andando_baixo")
			sprite.flip_h = false
			ultimaAnimacao = 4
		else:
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


func _on_AnimationPlayer_animation_finished(anim):
	pass


