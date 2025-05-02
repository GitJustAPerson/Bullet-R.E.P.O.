extends Node;

@onready var title: Label = $Title;
@onready var button: Button = $Button;
@onready var flash_timer: Timer = $FlashTimer;

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D";

signal game_start;

const PLAY_BUTTON_PRESSED = preload("res://assets/sounds/play_button_pressed.wav");
@onready var level_manager: Node = $"../LevelManager"

func _on_button_pressed() -> void:
	button.disabled = true;
	
	var level: Node2D = level_manager.load_level("res://assets/scenes/levels/test_level.tscn");
	level.position = Vector2(0.0, 0.0);
	level.visible = false;
	
	audio_stream_player_2d.stream = PLAY_BUTTON_PRESSED;
	audio_stream_player_2d.play();
	
	flash_timer.start()
	
	for i in 8:
		button.modulate = Color(0, 0, 0);
		await flash_timer.timeout
		button.modulate = Color(255, 255, 255);
		flash_timer.start()
		await flash_timer.timeout
		
	
	title.queue_free();
	button.queue_free();
	
	#add_child(level);
	level.visible = true;
	
	game_start.emit();
