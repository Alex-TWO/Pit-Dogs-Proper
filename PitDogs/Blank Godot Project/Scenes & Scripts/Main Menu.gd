extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	Global.next_scene = "res://Scenes & Scripts/Rooms/TestRoom.tscn"
	SceneChanger.change_scene()


func _on_QuitButton_pressed():
	get_tree().quit()
