extends Control

@onready var name_label: Label = $Panel/NameLabel
@onready var rarity_label: Label = $Panel/RarityLabel
@onready var desc_label: Label = $Panel/DescriptionLabel

# Diccionario con los datos de la carta
var card_data: Dictionary = {}

# Función pública para asignar una carta a esta vista
func set_card(data: Dictionary) -> void:
	card_data = data
	_update_view()

# Actualiza los textos en pantalla según los datos recibidos
func _update_view() -> void:
	if card_data.is_empty():
		return

	name_label.text = card_data.get("name", "Sin nombre")
	rarity_label.text = "Rareza: %s" % card_data.get("rarity", "desconocida")
	desc_label.text = card_data.get("description", "No hay descripción.")
