extends Node2D


onready var spr = get_node("Top")
export var colour = Color()

signal pushed

# Called when the node enters the scene tree for the first time.
func _ready():
	spr.self_modulate = colour


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Col_body_entered(body):
	spr.frame = 3
	emit_signal("pushed")


func _on_Col_body_exited(body):
	spr.frame = 2
