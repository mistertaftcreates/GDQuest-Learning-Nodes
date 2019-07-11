extends Area2D

"""
This is a very simple scene to queue this
object free if the player walks over it.
"""

func _on_Coin_area_entered(area):
	if area.is_in_group("Player"):
		queue_free()

