# PAULAR WELLORD-IAC2-GAMDES1-10/10/2026
extends CharacterBody2D

var health = 100
const SPEED: float = 300.0
const JUMP_VELOCITY: float = -450.0
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var start_position: Vector2

func _ready() -> void:
	print("Player Ready. Health: ", health)
	take_damage(30)
	start_position = global_position
	add_to_group("player")

func take_damage(amount):
	health -= amount
	print("Ouch! Health is now: ", health)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction: float = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED
	move_and_slide()
	
func respawn() -> void:
	global_position = start_position
	velocity = Vector2.ZERO
