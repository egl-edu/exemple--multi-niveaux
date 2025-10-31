extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect.color = Color.RED
	# Exemple de timer créé dans code
	# var timer_dans_code = get_tree().create_timer(2)
	# timer_dans_code.timeout.connect(_on_timer_timeout)


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		$Timer.start()


func _on_timer_timeout() -> void:
	$ColorRect.color = Color.BLUE
