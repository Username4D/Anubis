extends Node2D

const level_amount = 6
var position_buffer = 800

func _physics_process(delta: float) -> void:
	$camera.position.x = $player.position.x + 200
	$tilemap_bg.position.x = $camera.position.x / 2
	if $player.position.x > position_buffer - 2000:
		new_part()
		%parts.get_children()[0].queue_free()

func _ready() -> void:
	$camera/bg.visible = true
	new_part()
	new_part()
	new_part()
	new_part()
	new_part()

func _process(delta: float) -> void:
	if $player.movement_speed != 0:
		if len(%player_trail.points) < 100:
			%player_trail.remove_point(len(%player_trail.points) - 1)
			%player_trail.add_point(%player.position)
		else:
			%player_trail.remove_point(0)
			%player_trail.remove_point(len(%player_trail.points) - 1)
			%player_trail.add_point(%player.position)


func _on_player_request_trail_point() -> void:
	if $player.movement_speed != 0:
		%player_trail.add_point(%player.position)

func new_part():
	var part = load("res://scenes/level_parts/%d.tscn" % randi_range(0, level_amount - 1)).instantiate()
	part.position.x = position_buffer
	%parts.add_child(part)
	position_buffer += part.next_level_part_position
