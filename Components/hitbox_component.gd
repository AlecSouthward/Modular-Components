extends Area2D
class_name HitBoxComponent

func _init() -> void:
	monitoring = false
	collision_mask = 0
	
	connect("area_entered", hurtbox_entered)
	
func hurtbox_entered() -> void:
	print("WOW")
