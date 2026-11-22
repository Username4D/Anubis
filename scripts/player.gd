extends CharacterBody2D

var direction = -1
var movement_speed = 250

func _physics_process(delta: float) -> void:
	direction = -1 if Input.is_action_pressed("ui_up") else 1
	move_and_collide(Vector2(movement_speed, movement_speed * direction) * delta)
	$texture.rotation = move_toward($texture.rotation, 0.25 * PI * direction, delta * 24)
