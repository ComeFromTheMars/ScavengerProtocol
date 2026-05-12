extends CharacterBody2D

@export var speed : float = 150
var health : int = 100
var hunger : int = 100
var stamina : int = 100

func _physics_process(delta):
    var input_vector = Vector2.ZERO
    input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    
    if input_vector != Vector2.ZERO:
        input_vector = input_vector.normalized() * speed
        if Input.is_action_pressed("ui_shift") and stamina > 0:
            input_vector *= 1.5
            stamina -= 10 * delta
        else:
            stamina = min(stamina + 5 * delta, 100)
    
    velocity = input_vector
    move_and_slide()

    hunger -= 1 * delta
    if hunger <= 0 or health <= 0:
        print("Game Over")
