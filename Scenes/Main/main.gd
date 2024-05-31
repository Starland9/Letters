extends Control

signal target_word_node_updated(size: int)

@onready var _target_word_node = $VBoxContainer/TargetWord
@onready var cam = $Camera2D

const ZOOM_FACTOR = 3.5

var _test_word = "aqsdqsdqsdqsdqdqsdqsd"

func _ready():
	_update_target_word_node(_test_word)

func _update_target_word_node(word: String):
	await get_tree().create_timer(0).timeout
	_target_word_node.init_word(word)
	_update_cam_zoom_by_target_word_size(word)
	_set_target_word_note_in_good_screen_position(word)

func _update_cam_zoom_by_target_word_size(word: String):
	var char_count: int = word.length()
	var zoom = ZOOM_FACTOR / char_count
	cam.zoom = Vector2.ONE * zoom

func _set_target_word_note_in_good_screen_position(word: String):
	var char_count: int = word.length()
	_target_word_node.anchor_left = 0.03 * char_count
	_target_word_node.anchor_top = 0.05 * char_count
