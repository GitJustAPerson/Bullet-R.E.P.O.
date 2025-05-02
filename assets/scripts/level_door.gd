class_name LevelDoor

extends Area2D


@onready var level_manager: Node = get_parent().get_parent().get_parent().get_node("LevelManager");

func _on_body_entered(body: Node2D):
	print(body);

func _ready() -> void:

	body_entered.connect(_on_body_entered);
	print(level_manager);
