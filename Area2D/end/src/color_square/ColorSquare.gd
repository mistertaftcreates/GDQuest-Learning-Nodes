extends Area2D

"""
This is a node that serves to show how 
to get mouse over input to change a property, 
color in this case.
"""

onready var sprite = $Sprite

export (Color) var color_one
export (Color) var color_two

func _on_ColorSquare_mouse_entered():
	sprite.modulate = color_two

func _on_ColorSquare_mouse_exited():
	sprite.modulate = color_one
