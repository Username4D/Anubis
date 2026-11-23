extends Node2D

@export var next_level_part_position: float

func _ready() -> void:
	next_level_part_position = %level_end.position.x
