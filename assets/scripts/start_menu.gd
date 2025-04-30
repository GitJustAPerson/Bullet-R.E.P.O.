extends Node

@onready var title: Label = $Title
@onready var button: Button = $Button
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

signal game_start

const PLAY_BUTTON_PRESSED = preload("res://assets/sounds/play_button_pressed.wav")

func _on_button_pressed() -> void:
	title.queue_free()
	button.queue_free()
	game_start.emit()
	audio_stream_player_2d.stream = PLAY_BUTTON_PRESSED
	audio_stream_player_2d.play()
