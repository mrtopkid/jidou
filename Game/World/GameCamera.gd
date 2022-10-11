extends Camera2D

export var MOVE_SPEED = 200
# Lower cap for the `_zoom_level`.
export var min_zoom := 0.5
# Upper cap for the `_zoom_level`.
export var max_zoom := 5
# Controls how much we increase or decrease the `_zoom_level` on every turn of the scroll wheel.
export var zoom_factor := 0.1
# Duration of the zoom's tween animation.
export var zoom_duration := 0.2


var _zoom_level := 1.0 setget _set_zoom_level

onready var zoom_tween: Tween = $ZoomTween

func _set_zoom_level(value: float) -> void:
	_zoom_level = clamp(value, min_zoom, max_zoom)
	
	zoom_tween.interpolate_property(
		self,
		"zoom",
		zoom,
		Vector2(_zoom_level, _zoom_level),
		zoom_duration,
		zoom_tween.TRANS_SINE,
		zoom_tween.EASE_OUT
	)
	zoom_tween.start()
	
func _unhandled_input(event):
	if event.is_action_pressed("m_zoom_in"):
		_set_zoom_level(_zoom_level - zoom_factor)
	if event.is_action_pressed("m_zoom_out"):
		_set_zoom_level(_zoom_level + zoom_factor)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var viewport = get_viewport().size
	var mouse_pos = get_viewport().get_mouse_position()
	var viewport_center = viewport / 2
	
	var direction = viewport_center.direction_to(mouse_pos)
	
	global_position += direction * delta * MOVE_SPEED
	
	
	
	
	
	
	
	
