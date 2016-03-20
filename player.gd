
extends AnimatedSprite

var speed = 24.0

var heading_direction = 0.0
var anim

func _ready():
	anim = get_node('./anim')
	set_process(true)
	
func _process(delta):
	var pos = get_pos()
	pos.x += speed * delta * heading_direction
	pos = bound_pos(pos)
	set_pos(pos)
	
func bound_pos(pos):
	if pos.x > 152:
		pos.x = 152
	if pos.x < 28:
		pos.x = 28
	return pos

# Character Controller API
func move_left():
	set_flip_h(true)
	anim.play('walk')
	heading_direction = -1.0
	
func move_right():
	set_flip_h(false)
	anim.play('walk')
	heading_direction = 1.0
	
func stop():
	anim.play('idle')
	heading_direction = 0.0
