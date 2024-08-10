extends Node3D

@export var accel : int = 100
@export var brake : int = 30

var game_started : bool = false
@export var max_speed = 100
@export var power = 40


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_accel():
	var direction = Vector3(-sin($Forward.rotation.y), 0, -cos($Forward.rotation.y))
	var rotation_axis = direction.cross(Vector3(0,1,0))
	var total_force = Vector3(0,0,0)
	
	if $TireOrb.get_contact_count() > 0:
		var collision_direction = $TireOrb.global_position.direction_to($TireOrb.collision_pos)
		var coll_force = collision_direction.cross(rotation_axis)
		total_force -= coll_force
	
	var tire_velocity = $TireOrb.get_linear_velocity()
	var speed = tire_velocity.length()
	
	#less force if youre close to max speed unless you're slowing down
	var balance = 1 - (speed/max_speed) * direction.dot(tire_velocity)
	var final_force = power * total_force * balance
	#print(final_force)
	#if final_force.y > 9:
		#final_force.y = 9
	return final_force

func _physics_process(delta):
	if not game_started:
		return
	#Make Camera Controller Match position of myself
	if Input.is_action_just_pressed("Reset"):
		$TireOrb.linear_velocity = Vector3(0,12,0)
		$TireOrb.global_position = Vector3(0,5,0)
	if Input.is_action_pressed("Accelerate"):
		var accel = get_accel()
		$TireOrb.apply_force(accel)
		#$TireOrb.rotate_z(PI/30)
	if Input.is_action_pressed("Left"):
		$Forward.rotate_y(PI/30)
	if Input.is_action_pressed("Right"):
		$Forward.rotate_y(-PI/30)
	$Forward.global_position = $TireOrb.global_position
	#$Forward.rotation = rotation
	#$TireOrb/Camera_Controller.position = lerp($TireOrb/Camera_Controller.position, $TireOrb.position,0.05)
	#$TireOrb/Camera_Controller.rotation.y = lerp_angle($TireOrb/Camera_Controller.rotation.y, $Forward.rotation.y, 0.05)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func StartGame():
	game_started = true
	$TireOrb/Camera_Controller.StartGame()


