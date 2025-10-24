extends Area2D


func monnaie_touchee(body):
	if body is Joueur:
		Main.augmenter_monnaies()
		call_deferred("queue_free")
