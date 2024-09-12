@tool
class_name Elemetum_Main
extends EditorPlugin

## Elementum plugin main class

## File location for save and load libraries
const LIBRARIES_FILE_LOCATION: String = "res://addons/Elementum/libraries.txt"

## Libraries names and locations
var libraries: Dictionary = {
	
}

func _enter_tree():
	#add_autoload_singleton("Elementum-Class", "res://addons/Elementum/ElementumClass.gd")
	libraries = _load_file()
	ProjectSettings.set("Elementum/Elementum/Addons", libraries)
	for lib in libraries:
		add_autoload_singleton(lib, libraries[lib])
	_save_file()


func _exit_tree():
	_save_file()
	for lib in libraries:
		remove_autoload_singleton(lib)


func _save_file():
	var file = FileAccess.open(LIBRARIES_FILE_LOCATION, FileAccess.WRITE)
	file.store_string(JSON.stringify(libraries))
	file.close()


func _load_file():
	var file = FileAccess.open(LIBRARIES_FILE_LOCATION, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return JSON.parse_string(content)
