extends Node2D

func _physics_process(delta: float) -> void:
	$camera.position.x = $player.position.x + 200
	$tilemap_bg.position.x = $camera.position.x / 2

func _ready() -> void:
	$camera/bg.visible = true

func _process(delta: float) -> void:
	if len(%player_trail.points) < 100:
		%player_trail.remove_point(len(%player_trail.points) - 1)
		%player_trail.add_point(%player.position)
	else:
		%player_trail.remove_point(0)
		%player_trail.remove_point(len(%player_trail.points) - 1)
		%player_trail.add_point(%player.position)


func _on_player_request_trail_point() -> void:
	%player_trail.add_point(%player.position)
