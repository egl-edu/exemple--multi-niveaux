extends Node

@export var monnaies = 0
signal monnaie_collectee


func augmenter_monnaies():
	monnaies += 1
	monnaie_collectee.emit(monnaies)

func changer_scene(nouvelle_scene:PackedScene):
	print("changer scene")
	get_tree().call_deferred("change_scene_to_packed", nouvelle_scene)
