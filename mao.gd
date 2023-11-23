extends Area2D


func _on_mao_body_entered(body):
	if body.has_method("hit_crab"):
		body.hit_crab()		
