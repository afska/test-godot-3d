extends Area

signal coin_collected

const ROTATION_SPEED = 3

func _physics_process(_delta):
	rotate_y(deg2rad(ROTATION_SPEED))

func _on_Coin_body_entered(body):
	if body.name == "Steve":
		emit_signal("coin_collected")
		$AnimationPlayer.play("bounce")

# (connected through Coin scene)
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "bounce":
		queue_free()
