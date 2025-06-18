extends Control
class_name Word

const _letter_scene = preload ("res://Objects/Letter/letter.tscn")

@onready var letters_container = $LettersContainer

@export
var _word: String = "": set = _set_word, get = get_word

var _target_word: String = ""

func init_word(word: String):
	_clear_letter_container()
	_set_word(word)
	for letter in word:
		var letter_node: Letter = _letter_scene.instantiate()
		letter_node.disable_drag()
		letter_node.init_from_assets(0, letter)
		letters_container.add_child(letter_node)

func init_from_stars(target_word: String) -> String:
	_clear_letter_container()
	_set_word("")
	_target_word = target_word
	for i in target_word.length():
		var letter_node := _letter_scene.instantiate()
		letter_node.init_from_assets(0, "*")
		letter_node.set_hidden_letter(target_word[i])
		letters_container.add_child(letter_node)
		_word += "*"

	return _word

func _clear_letter_container():
	for child in letters_container.get_children():
		letters_container.remove_child(child)
		child.queue_free()

func _set_word(word):
	_word = word

func get_word() -> String:
	return _word

func isEmpty() -> bool:
	return get_word().length() == 0

func isAllStars() -> bool:
	return get_word().is_valid_identifier()

func _get_letter_index_in_target_word(start_index: int, letter: String) -> int:
	if start_index >= _target_word.length():
		return - 1

	var target_idx = _target_word.find(letter, start_index)
	if target_idx < 0:
		return - 1

	if _word[target_idx] == "*":
		return target_idx
	else:
		return _get_letter_index_in_target_word(target_idx + 1, letter)

func set_letter(letter: String) -> String:
	if (not _target_word.contains(letter)) or isAllStars():
		return _word

	var index = _get_letter_index_in_target_word(0, letter)

	if not index < 0 or index > _word.length():
		_word = _word.substr(0, index) + letter + _word.substr(index + 1)

	return _word
