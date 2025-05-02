class_name LevelDoor

extends Area2D


@onready var level_manager: LevelManager = get_parent().get_parent().get_node("LevelManager")

@export var DestinationLevel: String;
@export var StartingPositionNode: String;

var has_entered = false;

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("interact"):
		var bodies: Array[Node2D] = get_overlapping_bodies();
	
		for body in bodies:
			if body.name == 'Player':
				if not has_entered:
					has_entered = true;
					
					body.velocity = Vector2(0.0, 0.0)
					
					var new_level: Node = level_manager.load_level("res://assets/scenes/levels/" + DestinationLevel + ".tscn");
					new_level.position = Vector2(0.0, 0.0);
					#get_parent().get_parent().get_parent().add_child(new_level)
					
					var starting_node: Node2D = new_level.get_node(StartingPositionNode)
					
					body.position = starting_node.position;
					
					get_parent().queue_free()
					
					break
	
