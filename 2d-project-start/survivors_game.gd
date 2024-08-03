extends Node2D


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio  = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_boss():
	var new_boss = preload("res://boss.tscn").instantiate()
	%PathFollow2D.progress_ratio  = randf()
	new_boss.global_position = %PathFollow2D.global_position
	add_child(new_boss)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleated():
	%GameOver.visible = true
	get_tree().paused = true


func _on_timer_2_timeout():
	spawn_boss()
