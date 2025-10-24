extends CanvasLayer

func _ready() -> void:
	%MonnaiesLabel.text = str(Main.monnaies)
	Main.monnaie_collectee.connect(retroaction_monnaie)	

func retroaction_monnaie(valeur_monnaies):
	%MonnaiesLabel.text = str(valeur_monnaies)
	%MonnaiesSFX.play()
