extends KinematicBody2D

const ACCELERATION = 512
const MAX_SPEED = 40
const FRICTION = 0.25
const GRAVITY = 200

var motion = Vector2.ZERO

func _physics_process(delta):
	
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input !=0:
		$AnimationPlayer.play("Walk")
		motion.x += x_input * ACCELERATION * delta
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		$Sprite.flip_h = x_input < 0
	else:
		$AnimationPlayer.play("Idle")
		
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION)
		
	motion.y += GRAVITY * delta
	
	motion = move_and_slide(motion, Vector2.UP)
	
