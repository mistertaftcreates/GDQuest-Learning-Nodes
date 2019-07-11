extends Area2D

""" 
This is just me playing around with making a 
fast/slow patch of ground
"""

export (float) var speed_change

func _on_SlowZone2_body_entered(body):
	if body.is_in_group("Player"):
		body.speed_multiplier = speed_change

func _on_SlowZone2_body_exited(body):
	if body.is_in_group("Player"):
		body.speed_multiplier = 1
