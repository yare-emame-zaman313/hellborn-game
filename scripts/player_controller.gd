extends CharacterBody3D

# Player Controller Script - FPS Movement and Camera Control

@export var movement_speed: float = 7.0
@export var sprint_speed: float = 12.0
@export var jump_force: float = 5.0
@export var gravity: float = 9.8
@export var mouse_sensitivity: float = 0.003

var is_sprinting: bool = false
var camera: Camera3D

func _ready() -> void:
	camera = $Camera3D
	if camera == null:
		push_error("Camera3D not found as child of Player")
		return
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	# Handle movement
	handle_movement(delta)
	
	# Handle jumping
	handle_jumping(delta)
	
	# Apply gravity
	velocity.y -= gravity * delta
	
	# Move the character
	move_and_slide()

func _input(event: InputEvent) -> void:
	# Handle mouse look (camera control)
	if event is InputEventMouseMotion:
		handle_mouse_look(event)
	
	# Handle sprint toggle
	if event.is_action_pressed("ui_sprint"):
		is_sprinting = true
	if event.is_action_released("ui_sprint"):
		is_sprinting = false
	
	# Handle escape to release mouse
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func handle_movement(delta: float) -> void:
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var current_speed = sprint_speed if is_sprinting else movement_speed
	
	var forward = -transform.basis.z
	var right = transform.basis.x
	
	velocity.x = (forward * input_dir.y + right * input_dir.x).x * current_speed
	velocity.z = (forward * input_dir.y + right * input_dir.x).z * current_speed

func handle_jumping(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force

func handle_mouse_look(event: InputEventMouseMotion) -> void:
	# Rotate player body for horizontal look
	rotate_y(-event.relative.x * mouse_sensitivity)
	
	# Rotate camera for vertical look
	camera.rotate_object_local(Vector3.RIGHT, -event.relative.y * mouse_sensitivity)
	
	# Clamp vertical rotation to prevent over-rotation
	camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
