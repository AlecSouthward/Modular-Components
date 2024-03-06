@icon("../../module.svg")
extends Node3D
class_name VelocityComponent3D

@export var acceleration := 1.0
@export var acceleration_multiplier := 3.0
@export var max_speed := 30.0

var velocity := Vector3.ZERO

func move(character_body : CharacterBody3D) -> void:
	velocity = velocity.limit_length(max_speed)
	
	character_body.velocity = velocity
	character_body.move_and_slide()

func slowdown(rate := 1.0) -> Vector3:
	accel_velocity(Vector3.ZERO, rate)
	return velocity
	
func stop() -> void:
	set_velocity(Vector3.ZERO)

func set_max_speed(new_max_speed : float) -> float:
	max_speed = new_max_speed
	return max_speed

func max_velocity(direction : Vector3) -> void:
	accel_velocity(max_speed * direction)

## Accelerates to the velocity over time, instead of instantly adding it.
func accel_velocity(new_velocity : Vector3, accel_multiplier := 1.0) -> Vector3:
	var delta := get_process_delta_time()
	
	new_velocity = velocity.lerp(new_velocity, delta * acceleration * accel_multiplier * acceleration_multiplier)
	velocity = new_velocity
	
	return velocity

## Instantly adds the velocity, instead of over time.
func set_velocity(new_velocity : Vector3) -> void:
	velocity = new_velocity

## Instantly adds the velocity, instead of over time.
func add_velocity(added_velocity : Vector3) -> Vector3:
	return accel_velocity(velocity + added_velocity)
