@icon("../module.svg")
extends Node
class_name HealthComponent

@export var max_health := 20

var health := max_health
var alive := true

signal Died

func damage(amount := 0) -> void:
	if alive:
		health = clamp(health - abs(amount), 0, max_health)
		
		if health == 0: kill()
	else: print(owner.name + " is already dead!")

func heal(amount := 0) -> void:
	if alive:
		health = clamp(health + abs(amount), 0, max_health)
	else: print(owner.name + " is already dead!")

func kill() -> void:
	Died.emit()
	health = 0
	alive = false
