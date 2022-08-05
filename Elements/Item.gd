extends RigidBody2D

var estado
var can_press=true
var mouse
var viewport
var vocals={1:'a',2:'e',3:'i',4:'o',5:'u'}
export var n_letter=0
onready var colision=$CollisionPolygon2D
onready var button=$Button
onready var anim=$AnimationPlayer
onready var audio=$AudioStreamPlayer

func _ready():
	angular_velocity=Global.random(-1,1)
	button.text=vocals[n_letter]

func _process(_delta):
	mouse = get_global_mouse_position()
	viewport = get_viewport_rect().size
	if can_press:
		if Input.is_action_pressed("clic_der") and estado and Global.can_play:
			if mouse<viewport and mouse.y<550 and mouse.x>0 and mouse.y>50:
				rotation_degrees=0
				set_collision_layer_bit(0,false)
				set_collision_mask_bit(0,false)
				set_collision_layer_bit(1,true)
				set_collision_mask_bit(1,true)
				self.position = get_global_mouse_position()
				mode=RigidBody2D.MODE_KINEMATIC
			else:
				estado=false
				set_collision_layer_bit(0,true)
				set_collision_mask_bit(0,true)
				set_collision_layer_bit(1,false)
				set_collision_mask_bit(1,false)
		elif !Input.is_action_pressed("clic_der") or !estado:
			mode=RigidBody2D.MODE_RIGID
			set_collision_layer_bit(0,true)
			set_collision_mask_bit(0,true)
			set_collision_layer_bit(1,false)
			set_collision_mask_bit(1,false)
	else:
		set_collision_layer_bit(0,false)
		set_collision_mask_bit(0,false)
		set_collision_layer_bit(1,true)
		set_collision_mask_bit(1,true)
		mode=RigidBody2D.MODE_KINEMATIC

func insert():
	set_deferred("colision.disabled",true)
	can_press=false
	set_deferred("mode",3)
	rotation_degrees=0
	button.disabled=true
	button.pressed=false
	anim.play("particles")
	Global.total+=1

func _on_Button_button_down():
	estado=true
	if Global.can_play:
		audio.volume_db=-8
		var resource="res://assets/sounds/vocals/"+str(Global.opcion)+str(vocals[n_letter])+".mp3"
		audio.stream=load(resource)
		audio.play()


func _on_Button_button_up():
	estado=false
