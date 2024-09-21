@tool
class_name Elemetum_Plugin
extends EditorPlugin

## Elementum plugin main class

func _enter_tree():
	var dir := DirAccess.open("res://addons/Elementum/Libraries")
	if dir != null:
		dir.list_dir_begin()
		for file: String in dir.get_files():
			var lib_path := dir.get_current_dir() + "/" + file
			var lib_name = lib_path.get_file().split(".")[0]
			add_autoload_singleton(lib_name, lib_path)
		if not ProjectSettings.has_setting("Elementum/Settings/LoadMessage"):
			ProjectSettings.set_setting("Elementum/Settings/LoadMessage", "Elementum libraries loaded, ENJOY!")
		ProjectSettings.set_initial_value("Elementum/Settings/LoadMessage", "Elementum libraries loaded, ENJOY!")
		if not ProjectSettings.has_setting("Elementum/Settings/ShowLoadMessage"):
			ProjectSettings.set_setting("Elementum/Settings/ShowLoadMessage", true)
		ProjectSettings.set_initial_value("Elementum/Settings/ShowLoadMessage", true)
		if ProjectSettings.get_setting("Elementum/Settings/ShowLoadMessage"):
			print_debug(ProjectSettings.get_setting("Elementum/Settings/LoadMessage"))

func _exit_tree():
	var dir := DirAccess.open("res://addons/Elementum/Libraries")
	if dir == null: printerr("Could not open folder"); return
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var lib_path := dir.get_current_dir() + "/" + file
		var lib_name = lib_path.get_file().split(".")[0]
		remove_autoload_singleton(lib_name)
