@icon("../../module.svg")
extends Area3D
class_name HurtBoxComponent3D

@export var damage := 10
@export var impact_power := 10

func _init() -> void:
	monitoring = false
	collision_mask = 0
