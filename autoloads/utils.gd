extends Node

func remove_accent(word: String):
	# Les accents aigus (é)
	var new_word = word.replace("é", "e").replace("É", "E")

	# Les accents graves (è, à, ù)
	new_word = new_word.replace("è", "e").replace("È", "E")
	new_word = new_word.replace("à", "a").replace("À", "A")
	new_word = new_word.replace("ù", "u").replace("Ù", "U")

	# Les accents circonflexes (ê, î, ô, û)
	new_word = new_word.replace("ê", "e").replace("Ê", "E")
	new_word = new_word.replace("î", "i").replace("Î", "I")
	new_word = new_word.replace("ô", "o").replace("Ô", "O")
	new_word = new_word.replace("û", "u").replace("Û", "U")

	# Les trémas (ë, ï, ö, ü)
	new_word = new_word.replace("ë", "e").replace("Ë", "E")
	new_word = new_word.replace("ï", "i").replace("Ï", "I")
	new_word = new_word.replace("ö", "o").replace("Ö", "O")
	new_word = new_word.replace("ü", "u").replace("Ü", "U")

	# Le c cédille (ç)
	new_word = new_word.replace("ç", "c").replace("Ç", "C")

	return new_word
