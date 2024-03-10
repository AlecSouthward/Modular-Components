@icon("../../module.svg")
extends Node3D
class_name VelocityComponent3D
## Used to easily manage velocity of 3D Rigidbodies and CharacterBodies

## Specifies the acceleration of the velocity to a new velocity.
@export var acceleration := 1.0

## Multiplier for the acceleration.
@export var acceleration_multiplier := 3.0

## Limits the length of the velocity.
@export var max_speed := 30.0

## The current velocity.
var velocity := Vector3.ZERO

## Sets a [CharacterBody3D]'s velocity to the current velocity.
## Will also call [method CharacterBody3D.move_and_slide] function on the [CharacterBody3D].
func move_character(character_body : CharacterBody3D) -> void:
	velocity = velocity.limit_length(max_speed)
	
	character_body.velocity = velocity
	character_body.move_and_slide()
	
	if (character_body.velocity.x == 0):
		velocity.x = 0

	if (character_body.velocity.y == 0):
		velocity.y = 0

## Sets a [RigidBody3D]'s velocity to the current velocity.
func move_body(rigidbody : RigidBody3D) -> void:
	velocity = velocity.limit_length(max_speed)
	
	rigidbody.linear_velocity = velocity
	
	if (rigidbody.linear_velocity.x == 0):
		velocity.x = 0

	if (rigidbody.linear_velocity.y == 0):
		velocity.y = 0

## Slows down the velocity by the specified rate.
func slowdown(rate := 1.0) -> Vector3:
	accel_velocity(Vector3.ZERO, rate)
	return velocity

## Sets the velocity to (0, 0, 0).
func stop() -> void:
	set_velocity(Vector3.ZERO)

## Changes the max speed.
func set_max_speed(new_max_speed : float) -> float:
	max_speed = new_max_speed
	return max_speed

## Sets the velocity to it's max speed in the specified direction.
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
