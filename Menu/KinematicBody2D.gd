extends KinematicBody2D

# declaring variables names
const aceleracao = 500
const velocidade_Max = 80
const atrito = 500 


var velocidade = Vector2.ZERO 

onready var animationPlayer = $AnimationPlayer 

# receiveng keyboard inputs 
func _physics_process(delta):
	var input_vector = Vector2.ZERO 
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

#programming the code beyond animation and more code about movement
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			animationPlayer.play("correrdireita")
		else: 
			animationPlayer.play("correresquerda")
		velocidade = velocidade.move_toward(input_vector * velocidade_Max , aceleracao * delta)
	else: 
		animationPlayer.play("paradodireita")
		velocidade = velocidade.move_toward(Vector2.ZERO, atrito * delta)
		
	velocidade = move_and_slide(velocidade)	
