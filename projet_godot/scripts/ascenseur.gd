extends AnimatableBody2D

@export var range_y = 0
@export var duration = 5

var position_base_y
var tween

func _ready() -> void:
	position_base_y = position.y
	var start = position_base_y
	var end = position_base_y - range_y
	tween = self.create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_loops()
	tween.tween_property(self, "position:y", end, duration).from(start)
	tween.tween_property(self, "position:y", start, duration).from(end)
