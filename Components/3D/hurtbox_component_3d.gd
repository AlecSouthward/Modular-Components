@icon("../../module.svg")
extends Area3D
class_name HurtBoxComponent3D
## Used for hitting [HitBoxComponent3D]'s and applying damage to their [HealthComponent],[br]
##[i](if specified inside [HitBoxComponent3D])[/i].

## Amount of damage to deal to a [HitBoxComponent3D]'s [HealthComponent],[br]
##[b](if specified inside [HitBoxComponent3D])[/b].
@export var damage := 10

func _init() -> void:
	monitoring = false
	collision_mask = 0
