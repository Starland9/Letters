extends Control
class_name Word

const _letter_scene = preload ("res://Objects/Letter/letter.tscn")

@onready var letters_container = $LettersContainer

@export
var _word: String = "hello_world": set = _set_word, get = get_word

func init_word(word: String):
	_clear_letter_container()
	_set_word(word)
	for letter in word:
		var letter_node := _letter_scene.instantiate()
		letter_node.init_from_assets(0, letter)
		letters_container.add_child(letter_node)

func _clear_letter_container():
	for child in letters_container.get_children():
		letters_container.remove_child(child)
		child.queue_free()

func _set_word(word):
	_word = word
	
func get_word() -> String:
	return _word
