extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# sprite spieglen wenn spieler nach rechts läuft
	if Input.is_action_just_pressed("ui_left"):
		sprite.flip_h = false
	if Input.is_action_just_pressed("ui_right"):
		sprite.flip_h = true

	move_and_slide()


func _on_inventar_item_used(itemID: int) -> void:
	match itemID:
		0: # das ist testItem01.png bzw. der "Apfel"
			print("used testItem01")
		1: # das ist testItem02.png bzw. das "blaue Dreieck"
			print("used testItem02")
		2: # das ist testItem03.png bzw. das "orangene Viereck"
			print("used testItem03")
		_: # ist die itemID nich definiert wird das hier getan
			print("used item with ID "+str(itemID))
