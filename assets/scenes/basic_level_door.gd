extends LevelDoor

@onready var top_sprite: Sprite2D = $TopSprite
@onready var bottom_sprite: Sprite2D = $BottomSprite
@onready var level_door: LevelDoor = $"."
@onready var player: CharacterBody2D = get_parent().get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await level_door.entered;
	
	top_sprite.region_rect.position.y += 120;
	bottom_sprite.region_rect.position.y += 120;
	
	player.visible = false;
