class_name LevelManager

extends Node;

enum level_type {TEST_LEVEL, OTHER_TEST_LEVEL};

func load_level(level_name: String):
	var LEVEL_FILE = null;
	var LOADED_LEVEL = null;
	

	#print('test level')
	LEVEL_FILE = load(level_name);
	LOADED_LEVEL = LEVEL_FILE.instantiate();
	return LOADED_LEVEL
	
