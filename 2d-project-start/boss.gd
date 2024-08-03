extends CharacterBody2D

var health = 20
var stopping_distance = 300.0
var move_speed = 300.0

@onready var player = get_node("/root/Game/Player")

func _ready():
	$Slime.play_walk()

func _physics_process(delta):
		var direction = global_position.direction_to(player.global_position)
		var distance_to_player = global_position.distance_to(player.global_position)
		
		if distance_to_player > stopping_distance:
			velocity = direction * move_speed
		else:
			velocity = Vector2.ZERO
		
		move_and_slide()

func take_damage():
	health -= 1
	$Slime.play_hurt()
	
	if health <= 0:
		queue_free()
		
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
