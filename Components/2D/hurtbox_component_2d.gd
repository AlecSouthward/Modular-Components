@icon("../../module.svg")
extends Area2D
class_name HurtBoxComponent2D

@export var damage := 10

func _init() -> void:
	monitoring = false
	collision_mask = 0
