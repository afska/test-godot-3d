extends Spatial

func _on_you_win():
	get_tree().change_scene("res://screens/YouWin.tscn")

func _on_you_lose():
	get_tree().change_scene("res://screens/GameOver.tscn")
