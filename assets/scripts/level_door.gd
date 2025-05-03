class_name LevelDoor

extends Area2D


@onready var level_manager: LevelManager = get_parent().get_parent().get_node("LevelManager")
@onready var fade_effect: Line2D = get_parent().get_parent().get_node("TransitionEffect")

@export var DestinationLevel: String;
@export var StartingPositionNode: String;

var has_entered = false;

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("interact"):
		var bodies: Array[Node2D] = get_overlapping_bodies();
	
		for node in bodies:
			if node.name == 'Player':
				if not has_entered:
					if not fade_effect.transitioning:
						has_entered = true;
					
						var body: CharacterBody2D = node;
						
						body.velocity = Vector2(0.0, 0.0)
						body.motion_mode = body.MOTION_MODE_FLOATING;
						
						fade_effect.fade_in();
						
						await fade_effect.fade_in_end;
						
						var new_level: Node = level_manager.load_level("res://assets/scenes/levels/" + DestinationLevel + ".tscn");
						new_level.position = Vector2(0.0, 0.0);
						#get_parent().get_parent().get_parent().add_child(new_level)
						
						var starting_node: Node2D = new_level.get_node(StartingPositionNode)
						
						body.position = starting_node.position;
						body.motion_mode = body.MOTION_MODE_GROUNDED;
						
						fade_effect.fade_out();
						await fade_effect.fade_out_end;
						
						get_parent().queue_free()
						
						break
	
