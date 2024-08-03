extends CharacterBody2D

signal health_depleated

var health = 100.0

func take_player_damage():
	health -= 1
	
func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide() 
	
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	#print("Overlapping mobs:", overlapping_mobs.size())
	#for body in overlapping_mobs:
		#print("Overlapping body:", body.name) 
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleated.emit()
			


