extends StaticBody2D

@export var id_cle:String = "cle_bleu"

func _ready() -> void:
	add_to_group(id_cle)
	Main.cle_collectee.connect(debloquer)

func debloquer(cle):
	if cle.is_in_group(id_cle):
		call_deferred("queue_free")
