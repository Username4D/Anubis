extends CharacterBody2D

var direction = -1
var movement_speed = 250

signal request_trail_point

func _physics_process(delta: float) -> void:
	direction = -1 if Input.is_action_pressed("ui_up") else 1
	var col = move_and_collide(Vector2(movement_speed, movement_speed * direction) * delta)
	if col:
		movement_speed = 0
		$death_particle.emitting = true
	if movement_speed == 0:
		$texture.modulate.a = move_toward($texture.modulate.a, 0, delta * 3)
	$texture.rotation = move_toward($texture.rotation, 0.25 * PI * direction, delta * 24)
	$hitbox.rotation = move_toward($hitbox.rotation, 0.25 * PI * direction, delta * 24)
	
	if Input.is_action_just_pressed("ui_up"): request_trail_point.emit()
	if Input.is_action_just_released("ui_up"): request_trail_point.emit()
