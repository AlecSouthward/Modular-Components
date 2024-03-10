@icon("../../module.svg")
extends Area2D
class_name HitBoxComponent2D
## Used for managing when a Node gets hit by a [HurtBoxComponent2D].

@export_group("Components")
## Health component used for taking damage.
@export var health_component : HealthComponent

## Signal that is emitted when the HitBoxComponent2D is hit by a [HurtBoxComponent2D].
signal Hit

func _init() -> void:
	monitorable = false
	collision_layer = 0
	
	connect("area_entered", hurtbox_entered)

func _ready() -> void:
	if (!health_component):
		printerr("Missing HealthComponent on " + str(get_path()) + "'s HitBoxComponent")

## Function that is run on a [HurtBoxComponent2D] collision.[br]
## Applies the [member HurtBoxComponent2D.damage] to the health component
## and emits [signal HitBoxComponent2D.Hit].
func hurtbox_entered(area : Area2D) -> void:
	if (area is HurtBoxComponent2D):
		Hit.emit(area)
		
		if (health_component):
			health_component.damage(area.damage)
