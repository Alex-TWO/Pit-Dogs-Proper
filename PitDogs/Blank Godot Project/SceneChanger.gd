extends CanvasLayer

onready var black = $Control/ColorRect
onready var animation_player = $AnimationPlayer

func change_scene():
	animation_player.play("Fade")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(Global.next_scene)
	animation_player.play_backwards("Fade")

