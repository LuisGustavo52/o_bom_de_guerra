extends KinematicBody2D

var movimento = Vector2()
var ultimaAnimacao = 0
var vida = 3;

onready var anim = $sprite_boneco/AnimationPlayer
onready var sprite = $sprite_boneco
onready var colisao = $colisao_boneco

func morre():
	anim.play("morte")
	colisao.set_disabled(true)
	get_tree().change_scene("res:/OMEGA_PROJECT.tscn")

func hit_crab():
	print (vida)
	if (vida < 1):
		morre()
		print("alberto")
	vida -= 1
	

func ataque(var direcao):
	pass

func _physics_process(delta):			
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
		movimento.x = 300
		anim.play("andando_lado")
		sprite.flip_h = false
		ultimaAnimacao = 1
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -300
		anim.play("andando_lado")
		sprite.flip_h = true
		ultimaAnimacao = 2
	elif Input.is_action_pressed("ui_up"):
		movimento.y = -300
		anim.play("andando_cima")
		sprite.flip_h = false
		ultimaAnimacao = 3
	elif Input.is_action_pressed("ui_down"):
		movimento.y = 300
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
