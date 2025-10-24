extends Area2D

func _ready() -> void:
	body_entered.connect(monnaie_touchee)
	
func monnaie_touchee(body):
	if body is Joueur:
		Main.augmenter_monnaies()
		call_deferred("queue_free")
