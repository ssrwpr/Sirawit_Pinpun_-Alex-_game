extends CharacterBody2D
@onready var animation = $Area2D/AnimatedSprite2D2

@export var SPEED = 200

var coin = 0
var total_coins = 0

@onready var coins_group = get_tree().get_nodes_in_group("coins")
@onready var global = get_node("/root/Global")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation.play("Snail")
	global.star = 0
	global.health = 3
	for coin in coins_group:
		total_coins += 1
		
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$Area2D/AnimatedSprite2D2.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
		
func _death(area):
	if area.has_meta("spike"):
		if global.health > 0:
			position = Vector2(183, 180)
			global.health -= 1
		else:
			get_tree().reload_current_scene()
		
		position = Vector2(183, 180)


func _win(area):
	if area.has_meta("Door"):
		if total_coins == global.star:
			get_tree().change_scene_to_file("res://Win.tscn")
		
func _portal(area):
	if area.has_meta("Portal"):
		area.do_lock()
		global_position = area.portal_location

	



