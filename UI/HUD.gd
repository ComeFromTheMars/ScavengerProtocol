extends CanvasLayer

onready var health_label = $HealthLabel
onready var hunger_label = $HungerLabel
onready var stamina_label = $StaminaLabel

func _process(delta):
    var player = get_node_or_null("/root/Main/Player")
    if player:
        health_label.text = "HP: %d" % player.health
        hunger_label.text = "Hunger: %d" % player.hunger
        stamina_label.text = "Stamina: %d" % player.stamina
