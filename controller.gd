
extends Node

var player
var last_h_axis = 0

func _ready():
	player = get_node('../player')
	set_process(true)
	
func _process(delta):
	var h_axis = get_h_axis()
	
	if last_h_axis != h_axis:
		move_player(h_axis)
		
	last_h_axis = h_axis
	
func get_h_axis():
	var h_axis = 0
	if Input.is_action_pressed('player_left'):
		h_axis -= 1
	if Input.is_action_pressed('player_right'):
		h_axis += 1
		
	return h_axis
	
func move_player(h_axis):
	if h_axis > 0:
		player.move_right()
	elif h_axis < 0:
		player.move_left()
	else:
		player.stop()


