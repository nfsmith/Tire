extends RigidBody3D

var collision_pos : Vector3 = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state : PhysicsDirectBodyState3D):
	if state.get_contact_count() > 0:
		collision_pos = to_global(to_local(state.get_contact_local_position(0)))
