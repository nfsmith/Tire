extends Node3D

var tick : float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tick += 1
	position.y = sin(tick/100)
	rotate_y(.01)


func _on_hit_box_body_entered(body):
	print(body.name)
	if body.name == "TireOrb":
		print("any collectors?")
		queue_free()
