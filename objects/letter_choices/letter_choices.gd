extends Control
class_name LetterChoices

signal letter_pressed(letter: Letter)

@onready var grid = $GridContainer

const letter_scene = preload ("res://objects/letter/letter.tscn")

var _letters: Array = []
var _target_word_node: Word = null

func _ready():
	pass

func init_from_word(word: Word):
	_target_word_node = word
	_letters = Array(_target_word_node.get_word().split(""))
	_letters.shuffle()
	_init_choices_container()

func init_from_string(word: String):
	_letters = Array(word.split(""))
	_letters.shuffle()
	_init_choices_container()

func _init_choices_container():
	_clear()

	for letter in _letters:
		var letter_node = letter_scene.instantiate()
		letter_node.init_from_assets(0, letter)
		letter_node.pressed.connect(_on_letter_pressed)
		grid.add_child(letter_node)

func _clear():
	for child in grid.get_children():
		child.queue_free()

func _on_letter_pressed(letter: Letter):
	letter_pressed.emit(letter)

func remove_letter(letter: Letter):
	_letters.erase(letter.get_letter())
	_init_choices_container()

func _remove_letter_string(letter: String):
	_letters.erase(letter)
	_init_choices_container()

func remove_unused_letter(word: String, target_word: String):
	for letter in word:
		if target_word.contains(letter):
			_remove_letter_string(letter)
			break
