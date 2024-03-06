extends CharacterBody2D

@onready var health_comp : HealthComponent = $HealthComponent
@onready var velocity_comp : VelocityComponent2D = $VelocityComponent2D

var input : Vector2

func _physics_process(_delta: float) -> void:
	input.x = Input.get_axis("ui_left", "ui_right")
	input.y = Input.get_axis("ui_up", "ui_down")
	input = input.normalized()
	
	if input.length() != 0:
		velocity_comp.max_velocity(input)
	else: velocity_comp.slowdown(1.5)
	
	velocity_comp.move(self)
