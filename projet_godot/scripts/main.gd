extends Node

@export var monnaies = 0
signal monnaie_collectee

var objectif_monnaies_niveau_2 = 4

signal cle_collectee

func debloquer_cle(cle):
	cle_collectee.emit(cle)


func augmenter_monnaies():
	monnaies += 1
	monnaie_collectee.emit(monnaies)

func changer_scene(nouvelle_scene:PackedScene):
	print("changer scene")
	get_tree().call_deferred("change_scene_to_packed", nouvelle_scene)
