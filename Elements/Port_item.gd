extends Node2D

export var n_letter=0
var vocals={1:'a',2:'e',3:'i',4:'o',5:'u'}
onready var label=$Label

func _ready():
	label.text=vocals[n_letter]


func _on_Area2D_body_entered(body):
	if body.is_in_group("item") and body.n_letter==n_letter and Input.is_action_pressed("clic_der"):
		body.insert()
		body.position=position
		visible=false
