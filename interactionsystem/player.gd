extends CharacterBody2D

@onready var interaction_area: Area2D = $InteractionArea
const Npc = preload("res://npc.gd")
const SPEED = 300

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Right"):
		position.x += -SPEED * delta
	if Input.is_action_pressed("Left"):
		position.x += SPEED * delta
	if Input.is_action_pressed("Up"):
		position.y += -SPEED * delta
	if Input.is_action_pressed("Down"):
		position.y += SPEED * delta
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		interact_with_npc()

func interact_with_npc():
	var area = $InteractionArea
	for body in area.get_overlapping_bodies(): 
		if body is Node2D:
			print("interacted")
			if body.has_method("interact"):  
				print("cted")
				body.interact()
			else:
				print("i cant find")
