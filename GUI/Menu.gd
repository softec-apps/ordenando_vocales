extends Control

onready var animation=$AnimationPlayer

func _ready():
	MusicController._play()
	animation.play("intro")


func _on_Button_pressed():
	return get_tree().change_scene("res://GUI/Choices.tscn")
