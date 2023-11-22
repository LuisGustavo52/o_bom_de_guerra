extends KinematicBody2D

var hit = 0

func hit():
	hit = hit + 1
	print(hit)

onready var anim = $AnimatedSprite

func _physics_process(delta):		
	pass
	#print (anim.get_animation())
	#if (anim.get_frame() == 1):
		



