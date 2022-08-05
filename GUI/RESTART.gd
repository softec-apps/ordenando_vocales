extends CanvasLayer

onready var animation=$AnimationPlayer
onready var game = get_tree().get_nodes_in_group("game")

func _ready():
	animation.play("restart")


func _on_Button_pressed():
	Global.total=0
	Global.can_play=false
	return get_tree().reload_current_scene()


func _on_back_pressed():
	Global.total=0
	Global.can_play=false
	return get_tree().change_scene("res://GUI/Choices.tscn")
