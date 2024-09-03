@tool
extends EditorPlugin

const ADDONS_FILE_LOCATION: String = "res://addons/Elementum/addons.elementcfg"

var addons: Dictionary = {
	
}

#region error codes
const ERR_ADDONS_SETTING_LOAD = 1

const ERR_ADDONS_SETTING_SAVE = 2
#endregion

func _enter_tree():
	add_autoload_singleton("Elementum", "res://addons/Elementum/ElementumInterface.gd")
	load_addons()
	ProjectSettings.set("Elementum/Elementum/Addons", addons)
	print(addons)
	for addon in addons.keys():
		load_addon_settings(addon)
	save_addons()


func _exit_tree():
	save_addons()
	for addon in addons.keys():
		save_addon_settings(addon)


func load_addons():
	if FileAccess.file_exists(ADDONS_FILE_LOCATION):
		var file = FileAccess.open(ADDONS_FILE_LOCATION, FileAccess.READ)
		if addons != null:
			addons = file.get_var()
		file.close()


func save_addons():
	var file = FileAccess.open(ADDONS_FILE_LOCATION, FileAccess.WRITE)
	file.store_var(addons)
	file.close()


func load_addon_settings(current_addon):
	var current_addon_file: String = addons[current_addon]
	var current_addon_settings: Dictionary = {}
	if FileAccess.file_exists(current_addon_file):
		var file = FileAccess.open(current_addon_file, FileAccess.READ)
		current_addon_settings = file.get_var()
		file.close()
		for setting in current_addon_settings.keys():
			ProjectSettings.set("Elementum/" + current_addon + "/" + setting, current_addon_settings[setting])
	else:
		elementum_error(ERR_ADDONS_SETTING_LOAD)
		get_tree().quit()


func save_addon_settings(current_addon):
	var current_addon_file: String = addons[current_addon]
	var current_addon_settings: Dictionary = {}
	if FileAccess.file_exists(current_addon_file):
		var file = FileAccess.open(current_addon_file, FileAccess.READ)
		current_addon_settings = file.get_var()
		file.close()
		for setting in current_addon_settings.keys():
			current_addon_settings[setting] = ProjectSettings.get_setting("Elementum/" + current_addon + "/" + setting)
		var save = FileAccess.open(current_addon_file, FileAccess.WRITE)
		save.store_var(current_addon_settings)
		save.close()
	else:
		elementum_error(ERR_ADDONS_SETTING_SAVE)
		get_tree().quit()


func elementum_error(error_code: int = 0):
	if error_code == ERR_ADDONS_SETTING_LOAD:
		push_error("Elementum: can't load addons setting!")
	if error_code == ERR_ADDONS_SETTING_SAVE:
		push_error("Elementum: can't save addons setting!")


