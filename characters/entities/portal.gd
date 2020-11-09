tool
extends Area2D

export(String, FILE) var next_scene: = ""
onready var _anim_player: = $"AnimationPlayer"


func _get_configuration_warning() -> String:
	if next_scene == "":
		return "Next scene must not be empty!"
	return ""

func _on_Portail_body_entered(body: Node) -> void:
	_anim_player.play("fade_out")
	yield(_anim_player, "animation_finished")
	get_tree().change_scene(next_scene)
