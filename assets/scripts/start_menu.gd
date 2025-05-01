extends Node;

@onready var title: Label = $Title;
@onready var button: Button = $Button;
@onready var flash_timer: Timer = $FlashTimer;

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D";

signal game_start;

const PLAY_BUTTON_PRESSED = preload("res://assets/sounds/play_button_pressed.wav");

func _on_button_pressed() -> void:
	button.disabled = true;
	
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
	
	game_start.emit();
