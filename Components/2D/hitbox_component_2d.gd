@icon("../../module.svg")
extends Area2D
class_name HitBoxComponent2D

@export_group("Components")
@export var health_component : HealthComponent

signal Hit

func _init() -> void:
	monitorable = false
	collision_layer = 0
	
	connect("area_entered", hurtbox_entered)

func _ready() -> void:
	if (!health_component):
		printerr("Missing health component on " + owner.name + "'s HitBoxComponent")
	
func hurtbox_entered(area : Area2D) -> void:
	if (area is HurtBoxComponent2D):
		Hit.emit(area)
		
		if (health_component):
			health_component.damage(area.damage)
