extends TextureRect
class_name Letter

signal pressed(letter: Letter)

@onready var area = $Area2D

var _draggable := true: get = get_draggable
var _is_dragging := false
var _drag_start_position := Vector2.ZERO
var _drag_end_position := Vector2.ZERO

@export var _letter: String: get = get_letter
var _hidden_letter: String: set = set_hidden_letter, get = get_hidden_letter
var _style: String

const LETTERS_PATH = "res://assets/letters/png/";
const EMPTY_WORDS = ["", " ", ".", "*"]
const BASE_MODULATE_A = 0.1

func _ready():
	pass

## init letter from assets
func init_from_assets(style_key: int, letter_name: String):
	var style_name: String = Manager.letterStyles.keys()[style_key]

	_letter = letter_name
	_style = style_name

	if _is_empty():
			texture = load(LETTERS_PATH + style_name.capitalize() + "/letter.png")
			modulate.a = BASE_MODULATE_A
			return

	texture = load(LETTERS_PATH + style_name.capitalize() + "/letter_" + _letter.to_upper() + ".png")

func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed and event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			_drag_start_position = event.position
			_is_dragging = true
			z_index = 2

		if event.is_released():
			_drag_end_position = event.position
			_is_dragging = false
			pressed.emit(self)

	if event is InputEventMouseMotion:

		if _is_dragging and _is_draggable():
			position += event.position - _drag_start_position

func _is_empty():
	return _letter in EMPTY_WORDS

func _is_draggable():
	return _draggable and not _is_empty()

func get_draggable():
	return _draggable

func disable_drag():
	_draggable = false

func enable_drag():
	_draggable = true

func get_letter() -> String:
	return _letter

func set_hidden_letter(letter: String):
	_hidden_letter = letter

func get_hidden_letter() -> String:
	return _hidden_letter

func _on_area_2d_area_entered(_area: Area2D):

	if get_hidden_letter() == _area.get_parent().get_letter():
		modulate.a = BASE_MODULATE_A * 5

func _on_area_2d_area_exited(_area: Area2D):
	if _is_empty():
		modulate.a = BASE_MODULATE_A
