extends KinematicBody2D

enum {BLUE, PINK, YELLOW, BLANK}

export (PackedScene) var Ball

var velocity = Vector2.ZERO
var speed_max = 400
var ball_colour = BLANK

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Anim").stop()


func push(v):
	velocity += v.normalized() * 10
	print(velocity)


func colour_ball(colour):
	ball_colour = colour
	var hex_c = ""
	
	match colour:
		BLUE:
			hex_c = Autoload.blue
		PINK:
			hex_c = Autoload.pink
		YELLOW:
			hex_c = Autoload.yellow
	
	modulate = Color(hex_c)


func _physics_process(delta):
	move_and_slide(velocity)
	
	if get_slide_count() > 0:
		var collision = get_slide_collision(0)
		velocity = velocity.bounce(collision.normal) * 0.7


func out_sequence():
	get_node("CollisionShape2D").disabled = true
	get_node("Anim").play("Out")


func _on_Anim_animation_finished(anim_name):
	if anim_name == "Out":
		queue_free()
