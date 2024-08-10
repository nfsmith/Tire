extends Node3D

@export var target : Node3D
@export var lerp_ratio = 0.1
var game_started = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not game_started:
		return
	position = lerp(position, target.position,lerp_ratio)
	rotation.y = lerp_angle(rotation.y, target.rotation.y, lerp_ratio)


func StartGame():
	game_started = true
