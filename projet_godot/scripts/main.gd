extends Node

func changer_scene(nouvelle_scene:PackedScene):
	print("changer scene")
	get_tree().change_scene_to_packed(nouvelle_scene)
