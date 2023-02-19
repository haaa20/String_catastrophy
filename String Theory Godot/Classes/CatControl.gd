extends Node2D


onready var cat = get_node("Cat")


func _on_Pointer_turned_off():
	cat.wander()


func _on_Pointer_turned_on():
	cat.pounce()
