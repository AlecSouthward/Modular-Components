extends Node2D

@onready var health_comp : HealthComponent = $HealthComponent

func _ready() -> void:
	health_comp.Died.connect(func(): print("They died!"))
	health_comp.damage(234)
	
