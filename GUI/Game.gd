extends Node2D

onready var audio = $AudioStreamPlayer
export var scene : PackedScene
var cont=1
var n_gems=1
var gems=[1,2,3,4,5]

func _ready():
	spawn_gems()
	audio.play()

func _process(_delta):
	if Global.total==5 and cont==1:
		var restart = scene.instance()
		add_child(restart)
		cont+=1


func spawn_gems():
	while n_gems<=5:
		gems[n_gems-1]=Global.random(1,5)
		var pos_gem=get_node("spawn/Position2D"+str(gems[n_gems-1]))
		var item=get_node("Item"+str(n_gems))
		item.position=pos_gem.position
		n_gems+=1


func _on_AudioStreamPlayer_finished():
	Global.can_play=true
