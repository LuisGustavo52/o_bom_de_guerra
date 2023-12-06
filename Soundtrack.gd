extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_Soundtrack_finished():
	if (Global.fase != 3):
		$Soundtrack.play()
