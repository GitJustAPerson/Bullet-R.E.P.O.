class_name LevelDoor

extends Area2D


@onready var level_manager: LevelManager = get_parent().get_parent().get_parent().get_node("LevelManager")

@export var DestinationLevel: String;
@export var StartingPositionNode: String;

var has_entered = false;

func _on_body_entered(body: Node2D):
	if body.name == 'Player':
		if not has_entered:
			has_entered = true;
			
			var new_level: Node = level_manager.load_level("res://assets/scenes/levels/" + DestinationLevel + ".tscn");
			new_level.position = Vector2(0.0, 0.0);
			get_parent().get_parent().get_parent().add_child(new_level)
			
			var starting_node: Node2D = new_level.get_node(StartingPositionNode)
			
			body.position = starting_node.position;
			
			get_parent().queue_free()

func _ready() -> void:

	body_entered.connect(_on_body_entered);
	print(level_manager.load_level);
