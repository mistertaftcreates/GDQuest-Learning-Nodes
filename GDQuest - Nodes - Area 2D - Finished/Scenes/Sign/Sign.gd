extends StaticBody2D

"""
This seems a bit smelly here.  I want 
a context clue to turn on when the player is in 
an area.  The Kinematic Body node doesn't have
an Area entered signal, so I have it change the player
through a method on the player.  But this seems
sloppy.
"""

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.change_context_clue()

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		body.change_context_clue()
