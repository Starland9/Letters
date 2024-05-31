extends Control
class_name LetterChoices

@onready var grid = $GridContainer

var letters: Array[String] = []
var target_word: String = ""

func _init_choices():
    pass