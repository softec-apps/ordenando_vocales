extends Node2D


func _ready():
	$AnimationPlayer.play("default")

func _on_english_pressed():
	Global.opcion="english/"
	return get_tree().change_scene("res://GUI/Game.tscn")


func _on_spanish_pressed():
	Global.opcion="spanish/"
	return get_tree().change_scene("res://GUI/Game.tscn")
