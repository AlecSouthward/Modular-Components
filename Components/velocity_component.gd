extends Node
class_name VelocityComponent

@export var character_body : CharacterBody2D
var velocity := Vector2.ZERO

func _ready() -> void:
	if character_body == null:
		printerr("Character body in velocity component is null")

func move() -> void:
	pass

## Accelerates to the velocity over time, instead of instantly adding it.
func accel_velocity(added_velocity : Vector2) -> void:
	pass

## Instantly adds the velocity, instead of over time.
func add_velocity(added_velocity : Vector2) -> void:
	pass
