extends KinematicBody2D

"""
This is a very simple top down four way 
movement script. 
There is a pseudo-state machine built into 
this script for the knockback.

"""

onready var stun_timer = $StunTimer
onready var knock_tween = $KnockbackTween

export (float) var speed
var movement: = Vector2.ZERO
var stunned: = false
var context_clue: = false

func _process(delta):
	move()

func move():
	if !stunned:
		movement = Vector2.ZERO
		if Input.is_action_pressed("down"):
			movement.y += 1
		if Input.is_action_pressed("up"):
			movement.y -= 1
		if Input.is_action_pressed("left"):
			movement.x -= 1
		if Input.is_action_pressed("right"):
			movement.x += 1
	movement = movement.normalized() * speed
	movement = move_and_slide(movement, Vector2.UP)

func stun(stun_time = 0.3):
	stunned = true
	stun_timer.wait_time = stun_time
	stun_timer.start()

func stun_knockback(direction):
	knock_tween.interpolate_property(self, "position", 
		position, position + direction, 0.3, Tween.TRANS_SINE, 
		Tween.EASE_OUT)
	knock_tween.start()

func _on_StunTimer_timeout():
	stunned = false

func change_context_clue():
	context_clue = !context_clue
	if context_clue:
		$ContextClueSprite.visible = true
	else:
		$ContextClueSprite.visible = false

func _on_HurtBox_area_entered(area):
	if area.is_in_group("Spikes"):
		var knock_direction = position - area.position
		stun()
		stun_knockback(knock_direction)
