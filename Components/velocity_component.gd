@icon("../module.svg")
extends Node
class_name VelocityComponent

@export var acceleration := 1.0
@export var max_speed := 30.0
var velocity := Vector2.ZERO

func move(character_body : CharacterBody2D) -> void:
	velocity = velocity.limit_length(max_speed)
	character_body.velocity = velocity
	character_body.move_and_slide()

func slowdown(rate := 1) -> void:
	accel_velocity(Vector2.ZERO, rate)
	
func stop() -> void:
	set_velocity(Vector2.ZERO)

## Accelerates to the velocity over time, instead of instantly adding it.
func accel_velocity(new_velocity : Vector2, accel_multiplier := 1) -> void:
	var delta := get_process_delta_time()
	
	new_velocity = velocity.lerp(new_velocity, delta * acceleration * accel_multiplier)
	velocity = new_velocity

## Instantly adds the velocity, instead of over time.
func set_velocity(new_velocity : Vector2) -> void:
	velocity = new_velocity

## Instantly adds the velocity, instead of over time.
func add_velocity(added_velocity : Vector2) -> void:
	velocity += added_velocity
