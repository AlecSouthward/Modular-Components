@icon("../../module.svg")
extends Node2D
class_name VelocityComponent2D

@export var acceleration := 1.0
@export var acceleration_multiplier := 3.0
@export var max_speed := 30.0

var velocity := Vector2.ZERO

func move(character_body : CharacterBody2D) -> void:
	velocity = velocity.limit_length(max_speed)
	
	character_body.velocity = velocity
	character_body.move_and_slide()

func slowdown(rate := 1.0) -> Vector2:
	accel_velocity(Vector2.ZERO, rate)
	return velocity
	
func stop() -> void:
	set_velocity(Vector2.ZERO)

func set_max_speed(new_max_speed : float) -> float:
	max_speed = new_max_speed
	return max_speed

func max_velocity(direction : Vector2) -> void:
	accel_velocity(max_speed * direction)

## Accelerates to the velocity over time, instead of instantly adding it.
func accel_velocity(new_velocity : Vector2, accel_multiplier := 1.0) -> Vector2:
	var delta := get_process_delta_time()
	
	new_velocity = velocity.lerp(new_velocity, delta * acceleration * accel_multiplier * acceleration_multiplier)
	velocity = new_velocity
	
	return velocity

## Instantly adds the velocity, instead of over time.
func set_velocity(new_velocity : Vector2) -> void:
	velocity = new_velocity

## Instantly adds the velocity, instead of over time.
func add_velocity(added_velocity : Vector2) -> Vector2:
	return accel_velocity(velocity + added_velocity)
