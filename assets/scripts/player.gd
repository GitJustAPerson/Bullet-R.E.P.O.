extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var sprite: AnimatedSprite2D = $"Sprite"
@onready var button: Button = $"../StartMenu/Button"

var has_game_started = false

func _ready() -> void:
	sprite.visible = false
	await button.pressed
	has_game_started = true
	sprite.visible = true


func _physics_process(delta: float) -> void:
	if has_game_started:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_pressed("walk_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("walk_left", "walk_right")
		if direction:
			velocity.x = direction * SPEED
			
			if direction < 0:
				sprite.flip_h = true
			else:
				sprite.flip_h = false
			
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
