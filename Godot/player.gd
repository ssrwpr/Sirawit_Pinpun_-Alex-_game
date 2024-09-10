extends CharacterBody2D
@onready var animation = $Area2D/AnimatedSprite2D2

@export var JUMP_VELOCITY = -400.0
@export var SPEED = 200

var coin = 0
var total_coins = 0
var portal_id = 0


@onready var coins_group = get_tree().get_nodes_in_group("coins")
@onready var global = get_node("/root/Global")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	global.star = 0
	global.health = 3
	for coin in coins_group:
		total_coins += 1
		
		
func _physics_process(delta):
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
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
	if area.has_meta("Bee"):
		if global.health > 0:
			global.health -= 1
			global_position = get_node("/root/Node2D/Respawn").global_position
		else:
			get_tree().reload_current_scene()
		
		


func _win(area):
	if area.has_meta("Door"):		
		if total_coins == global.star:
			if global.next_level + 1 < len(global.levels):
				get_tree().change_scene_to_file("res://Win.tscn")
			else:
				get_tree().change_scene_to_file("res://End.tscn")
			
		
			

		

		

	





func _on_area_2d_area_entered(area):
	if area.is_in_group("hurt_player"):
		pass
	elif area.is_in_group("portal"):
		if(!area.lock_portal):
			do_teleport(area)
	else:
		pass 
	
func do_teleport(area):
	for portal in get_tree().get_nodes_in_group("portal"):
		if(portal != area):
			if(portal.id == area.id):
				if(!portal.lock_portal):
					
					area.do_lock()
					global_position = portal.global_position
