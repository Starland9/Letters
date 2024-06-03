extends TextureRect
class_name Letter

signal pressed(letter: String)

var letter: String
var style: String

const LETTERS_PATH = "res://Assets/Letters/PNG/";
const empty_words = ["", " ", ".", "*"]

## init letter from assets
func init_from_assets(style_key: int, letter_name: String):
	var style_name = Manager.letterStyles.keys()[style_key]
	
	letter = letter_name
	style = style_name
	if letter_name in empty_words:
			texture = load(LETTERS_PATH + style_name.capitalize() + "/letter.png")
			modulate.a = 0.1
			return
			
	texture = load(LETTERS_PATH + style_name.capitalize() + "/letter_" + letter_name.to_upper() + ".png")

func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed and event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			pressed.emit(letter)
