extends Area

const ROTATION_SPEED = 3

func _physics_process(_delta):
	rotate_y(deg2rad(ROTATION_SPEED))

func _on_Coin_body_entered(body):
	if body.name == "Steve":
		$Timer.start()

func _on_Timer_timeout():
	queue_free()
