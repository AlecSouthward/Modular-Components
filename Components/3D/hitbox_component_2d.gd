@icon("../../module.svg")
extends Area3D
class_name HitBoxComponent3D

@export_group("Components")
@export var health_component : HealthComponent
@export var velocity_component : VelocityComponent3D

signal Hit

func _init() -> void:
	monitorable = false
	collision_layer = 0
	
	connect("area_entered", hurtbox_entered)

func _ready() -> void:
	if (!health_component and !velocity_component):
		printerr("Missing components on " + owner.name + "'s HitBoxComponent")
	
func hurtbox_entered(area : Area3D) -> void:
	if (area is HurtBoxComponent3D):
		Hit.emit(area)
		
		if (health_component):
			health_component.damage(area.damage)
		
		if (velocity_component):
			velocity_component.set_velocity((owner.position - area.position) * area.impact_power)
