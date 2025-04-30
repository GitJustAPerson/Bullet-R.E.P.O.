extends Node

@onready var title: Label = $Title
@onready var button: Button = $Button

func _on_button_pressed() -> void:
	title.queue_free()
	button.queue_free()
