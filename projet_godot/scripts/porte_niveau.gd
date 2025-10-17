# Dans un noued Porte basé sur un Area2D
extends Area2D

@export var nouvelle_scene:PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body is Joueur:
		Main.changer_scene(nouvelle_scene)
