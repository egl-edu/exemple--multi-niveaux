class_name Joueur
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const glisser_mur_mod = 0.15

@export var etat_courant = Etat.REPOS

enum Etat {
	REPOS,
	PROMENER,
	SAUT,
	GLISSE_MUR
}


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if is_on_wall() and velocity.y > 0:
			etat_courant = Etat.GLISSE_MUR
			velocity += get_gravity() * delta * glisser_mur_mod
			$AnimatedSprite2D.play("glisser_mur")
			if Input.is_action_just_pressed("sauter"):
				velocity.y = JUMP_VELOCITY
				velocity.x = move_toward(velocity.x, 0, sign(velocity.x) * SPEED)
		else:
			etat_courant = Etat.SAUT
			velocity += get_gravity() * delta
			$AnimatedSprite2D.play("sauter")
	else:
		if velocity.x == 0:
			etat_courant = Etat.REPOS
			$AnimatedSprite2D.play("repos")
		else:
			etat_courant = Etat.PROMENER
			$AnimatedSprite2D.play("promener")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	
	# Handle jump.
	if Input.is_action_just_pressed("sauter") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("promener_gauche", "promener_droite")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
