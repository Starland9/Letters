extends Control


const words_json: JSON = preload("res://assets/json/words.tres")

@onready var target_word_node = $VBoxContainer/CenterContainer/TargetWord
@onready var cam = $Camera2D
@onready var chooser = $VBoxContainer/CenterContainer2/LetterChoices

@onready var SCREEN_SIZE = get_viewport_rect().size

const ZOOM_FACTOR = 2.5


var _target_word = "tomate"
var _current_word = ""

func _ready():
	_init_target_word_node()
	_init_chooser()


func _init_target_word_node():
	_target_word = words_json.data[randi() % words_json.data.size()]["word"]
	_target_word = Utils.remove_accent(_target_word)
	var word = target_word_node.init_from_stars(_target_word)
	_update_cam_zoom_by_target_word_size(word)

func _update_cam_zoom_by_target_word_size(word: String):
	var char_count: int = word.length()
	var zoom = ZOOM_FACTOR / char_count
	cam.zoom = Vector2.ONE * zoom
	_center_cam()

func _center_cam():
	cam.position = SCREEN_SIZE / 2

func _init_chooser():
	chooser.init_from_string(_target_word)
	#chooser.letter_pressed.connect(_on_letter_choices_letter_pressed)

func _set_letter_in_current_word(letter: Letter):
	_current_word = target_word_node.set_letter(letter.get_letter())
	_update_target_word()
	chooser.remove_letter(letter)

func _update_target_word():
	target_word_node.init_word(_current_word)

func _on_letter_choices_letter_pressed(letter):
	_set_letter_in_current_word(letter)


func _on_restart_btn_button_up() -> void:
	get_tree().reload_current_scene()
