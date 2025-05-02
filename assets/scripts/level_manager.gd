extends Node;

enum level_type {TEST_LEVEL}

func load_level(level_name: level_type):
	var LEVEL_FILE = null;
	var LOADED_LEVEL = null;
	
	match level_name:
		level_type.TEST_LEVEL:
			print('test level')
			LEVEL_FILE = preload("res://assets/scenes/levels/test_level.tscn");
			LOADED_LEVEL = LEVEL_FILE.instantiate();
			return LOADED_LEVEL
		_:
			print('Not a valid level');
	
