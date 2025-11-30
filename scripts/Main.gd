extends Control

@onready var card_db: Node = $CardDatabase

func _ready() -> void:
	print("MAIN está vivo")

	var card_scene: PackedScene = load("res://scenes/CardView.tscn")
	var card_view: Control = card_scene.instantiate()
	add_child(card_view)

	card_view.position = Vector2(200, 100)

	if "cards" in card_db and card_db.cards.size() > 0:
		var first_card: Dictionary = card_db.cards[0]
		card_view.set_card(first_card)
	else:
		print("No hay cartas para mostrar")
