extends Area2D

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()	
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shootb():
	const BULLETB = preload("res://boss_bulet.tscn")
	var new_bullet = BULLETB.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	
func _on_timer_timeout():
	shootb()

