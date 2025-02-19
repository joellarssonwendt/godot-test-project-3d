extends Node3D

@onready var audio_player = $AudioStreamPlayer3D
@onready var collision_shape = $Area3D/CollisionShape3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		visible = false
		collision_shape.set_deferred("disabled", true)
		audio_player.play()
		await audio_player.finished
		queue_free()
		# add coin point to player ui
