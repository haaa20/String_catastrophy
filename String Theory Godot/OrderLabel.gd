extends Label

enum {BLUE, YELLOW, PINK}

onready var rng = RandomNumberGenerator.new()
var expected = null


func rand_order():
	var n = rng.randi_range(1, 2)
	match n:
		1:
			text = "ORDER : BLUE"
			expected = BLUE
		2:
			text = "ORDER : PINK"
			expected = PINK
		3: 
			text = "ORDER : YELLOW"
			expected = YELLOW


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	rand_order()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_OutGate_score(colour):
	if colour == BLUE:
		print("BLOO")
	rand_order()
