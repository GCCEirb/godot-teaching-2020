extends Node2D

export(String, FILE) var next_scene_path: String
onready var next_scene = load(next_scene_path)

func _on_Quit_pressed() -> void:
	notify(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func notify(what: int) -> void:
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		get_tree().quit()


func _on_NewGame_pressed() -> void:
	get_tree().change_scene_to(next_scene)
