extends Area2D

@onready var animation = $AnimatedSprite2D

# Play animation
func _ready():
	animation.play("Bee")

func _process(delta):
	pass
