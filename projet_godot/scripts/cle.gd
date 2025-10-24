extends Area2D

@export var groupe_cle:String

func _on_body_entered(body: Node2D) -> void:
	Main.debloquer_cle(self)
	# Desactive collision
	$CollisionShape2D.disabled = true
	# Ajouter des rétroactions
	$KeyBlue.visible = false
	%CleSfx.play()
	await %CleSfx.finished
	queue_free()
