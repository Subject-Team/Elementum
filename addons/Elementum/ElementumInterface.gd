extends Node

const ADDONS_FILE_LOCATION: String = "res://addons/Elementum/addons.elementcfg"

func new_addon(addon_name: String, settings: Dictionary = {}):
	var addons = ProjectSettings.get_setting("Elementum/Elementum/Addons")
	addons[addon_name] = "res://addons/Elementum/" + addon_name + ".element"
	print(addons)
	var addon_file = addons[addon_name]
	var save = FileAccess.open(addon_file, FileAccess.WRITE)
	save.store_var(settings)
	save.close()
	var file = FileAccess.open(ADDONS_FILE_LOCATION, FileAccess.WRITE)
	file.store_var(addons)
	file.close()
