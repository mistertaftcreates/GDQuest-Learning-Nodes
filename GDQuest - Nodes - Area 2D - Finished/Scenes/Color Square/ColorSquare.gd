extends Area2D

onready var sprite = $Sprite

export (Color) var color_one
export (Color) var color_two

func _on_ColorSquare_mouse_entered():
	sprite.modulate = color_two

func _on_ColorSquare_mouse_exited():
	sprite.modulate = color_one
