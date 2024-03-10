@icon("../module.svg")
extends Node
class_name HealthComponent
## Used for managing a Node's health. 

## Total/maximum amount of health.
@export var max_health := 20

## Current amount of health,[br]
## [b]Default is [member HealthComponent.max_health][/b].
var health := max_health

## Boolean for if the Node is alive or dead.
var alive := true

## Signal that is emitted when the Node dies.
signal Died

## Reduces the [member HealthComponent.health] by the amount specified,[br]
## and will kill if the [member HealthComponent.health] reaches 0.
func damage(amount := 0) -> void:
	if alive: 
		health = clamp(health - abs(amount), 0, max_health)
		
		if health == 0: kill()
	else: print(owner.name + " is already dead!")

## Increases the [member HealthComponent.health] by the amount specified,[br]
## and will not go higher than [member HealthComponent.max_health].
func heal(amount := 0) -> void:
	if alive: health = clamp(health + abs(amount), 0, max_health)
	else: print(owner.name + " is already dead!")

## Kills the Node, which emits the [signal HealthComponent.Died],
## sets [code]health = 0[/code], and [code]alive = false[/code].
func kill() -> void:
	Died.emit()
	health = 0
	alive = false
