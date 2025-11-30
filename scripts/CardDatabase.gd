extends Node

var cards: Array = []

func _ready() -> void:
	load_cards()
	print("Cartas cargadas: ", cards.size())
	if cards.size() > 0:
		print("Primera carta: ", cards[0]["name"])

func load_cards() -> void:
	var path := "res://data/cards.json"
	if not FileAccess.file_exists(path):
		push_warning("No se encontró cards.json en %s" % path)
		return

	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("No se pudo abrir cards.json")
		return

	var text := file.get_as_text()
	var parsed: Variant = JSON.parse_string(text)

	if typeof(parsed) == TYPE_DICTIONARY and parsed.has("cards"):
		cards = parsed["cards"]
	else:
		push_warning("cards.json no contiene un objeto { \"cards\": [] } válido")
		cards = []
