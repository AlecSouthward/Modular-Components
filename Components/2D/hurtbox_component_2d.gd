@icon("../../module.svg")
extends Area2D
class_name HurtBoxComponent2D
## Used for hitting [HitBoxComponent2D]'s and applying damage to their [HealthComponent],[br]
##[i](if specified inside [HitBoxComponent2D])[/i].

## Amount of damage to deal to a [HitBoxComponent2D]'s [HealthComponent],[br]
##[b](if specified inside [HitBoxComponent2D])[/b].
@export var damage := 10

func _init() -> void:
	monitoring = false
	collision_mask = 0
