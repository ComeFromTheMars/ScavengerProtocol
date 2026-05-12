extends CharacterBody2D

var health : int = 50
var speed : float = 80

func _physics_process(delta):
    if not get_node_or_null("/root/Main/Player"):
        return
    var player = get_node("/root/Main/Player")
    var direction = (player.position - position).normalized()
    velocity = direction * speed
    move_and_slide()
