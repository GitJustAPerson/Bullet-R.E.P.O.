extends Line2D

@onready var fade_timer: Timer = $FadeTimer
@onready var trans_node: Line2D = $"."


signal fade_out_end;
signal fade_in_end;

var transitioning = false

# Called when the node enters the scene tree for the first time.
func fade_in():
	
	transitioning = true;
	fade_timer.start();
	for i in 20:
		trans_node.modulate.a += 0.05
		await fade_timer.timeout;
		fade_timer.start();
		
	fade_timer.stop()
	transitioning = false;
	fade_in_end.emit();
	

func fade_out():
	
	transitioning = true;
	fade_timer.start();
	for i in 20:
		trans_node.modulate.a -= 0.05
		await fade_timer.timeout;
		fade_timer.start();
		
		
	fade_timer.stop()
	transitioning = false;
	fade_out_end.emit()
	
