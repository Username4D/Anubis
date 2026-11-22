extends Node2D

func _physics_process(delta: float) -> void:
	$camera.position.x = $player.position.x + 200
	$tilemap_bg.position.x = $camera.position.x / 2

func _ready() -> void:
	$camera/bg.visible = true
