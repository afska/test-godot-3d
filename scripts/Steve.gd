extends KinematicBody

signal you_lose

const SPEED = 8
const ROTATION_SPEED = 8

var velocity = Vector3(0, 0, 0)

func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROTATION_SPEED))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROTATION_SPEED))
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROTATION_SPEED))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROTATION_SPEED))
	else:
		velocity.z = lerp(velocity.z, 0, 0.1)
	
	var _ok = move_and_slide(velocity)

func _on_Enemy_body_entered(body):
	if body.name == "Steve":
		emit_signal("you_lose")
