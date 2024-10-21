extends CharacterBody2D
# Variables
@onready var animation = $Area2D/AnimatedSprite2D2

@export var jump_velocity = -400.0
@export var speed = 200

var coin = 0
var total_coins = 0
var portal_id = 0


@onready var coins_group = get_tree().get_nodes_in_group("coins")
@onready var global = get_node("/root/Global")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Variables from global script
func _ready():
	global.star = 0
	global.health = 3
	for coin in coins_group:
		total_coins += 1

# Player character actions		
func _physics_process(delta):
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Go left/Right
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		$Area2D/AnimatedSprite2D2.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()

# Reducing Lives
func _death(area):
	# If the player character collided with the bee/ -1 life/ go back to the starting position
	# If there is no global health to reduce, then reload the scene (restart the game)
	if area.has_meta("Bee"):
		if global.health > 0:
			global.health -= 1
			global_position = get_node("/root/Node2D/Respawn").global_position
		else:
			get_tree().reload_current_scene()

# Winning Condition		
func _win(area):
	if area.has_meta("Door"):		
		# If the player has the required stars, show the winning scene.
		# If there's no another level, show the END scene
		if total_coins == global.star:
			if global.next_level + 1 < len(global.levels):
				get_tree().change_scene_to_file("res://Win.tscn")
			else:
				get_tree().change_scene_to_file("res://End.tscn")

# Teleportation Portals		
func _on_area_2d_area_entered(area):
	if area.is_in_group("hurt_player"):
		pass
	elif area.is_in_group("portal"):
		# If the door is unlocked, teleport the player
		if(not area.lock_portal):
			do_teleport(area)
	else:
		pass 
		
# Teleporting	
func do_teleport(area):
	for portal in get_tree().get_nodes_in_group("portal"):
		if(portal != area):
			if(portal.id == area.id):
				if(not portal.lock_portal):
					area.do_lock()
					# Character's position is equal to the portal's position
					global_position = portal.global_position
