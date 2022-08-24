extends TextureButton

func _ready():
	pass

# function receive the button up input and output a game quit
func _on_QuitButton_button_up():
	get_tree().quit()
