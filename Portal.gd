extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func vitoria():
	$pontuamento.text = " Parabens "

func atualizaPontuamentos(pontuamento):
	$pontuamento.text = " Pontos: " + str(pontuamento)
