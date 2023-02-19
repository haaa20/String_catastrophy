extends Node2D


onready var anim = get_node("AnimationPlayer")
signal pulled


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pull_body_entered(body):
	if !anim.is_playing():
		emit_signal("pulled")
		anim.play("Pull")
