extends CharacterBody2D

@onready var health_comp : HealthComponent = $HealthComponent
@onready var velocity_comp : VelocityComponent = $VelocityComponent

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		velocity_comp.add_velocity(Vector2.RIGHT * 5)
	elif Input.is_action_pressed("ui_left"):
		velocity_comp.add_velocity(Vector2.LEFT * 5)
	else: velocity_comp.slowdown()
	
	velocity_comp.move(self)
