class_name Pickup extends Area2D

## einzigartige Identfikationsnummer für das Item
@export var ItemID:int = 0
## die Textur des Items
@export var ItemTextur:Texture2D;
## Anzahl, welche in das Inventar aufgenommen werden
@export var Anzahl:int = 1

@onready var sprite_2d: Sprite2D = $Sprite2D
# soll den außnahmenzustand regeln, dass es nicht möglich ist das item mehrmahls aufzunemen
var _has_been_added:bool = false


func _ready() -> void:
	# ohne eine Textur soll das Pickup nicht funktionieren
	if ItemTextur == null:
		push_error("Invalid Item Textur in Pickup")
		get_tree().quit(-1)
	else:
		sprite_2d.texture = ItemTextur

func _on_body_entered(body: Node2D) -> void:
	# wurde es bereit aufgenommen, darf es kein zweites mal aufgenommen werden (das pickup)
	if _has_been_added:
		return
	# jede Szene mit einem Inventar darin sollte in der "Inventarbesitzer" Gruppe sein
	if body not in get_tree().get_nodes_in_group("Inventarbesitzer"):
		return
	# ist der kollidierende body in der "Inventarbesitzer" Gruppe, so wird eine referenz zu seinem Inventar
	# gefunden und validiert
	var inventar_referenz:Inventar = null
	for child in body.get_children():
		if child is Inventar:
			inventar_referenz = child
			
	if not is_instance_valid(inventar_referenz):
		return
	# das assoziierte item wird zum inventar hinzugefügt
	inventar_referenz.add_item(ItemID,Anzahl,ItemTextur)
	_has_been_added = true
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	# wurde es bereit aufgenommen, darf es kein zweites mal aufgenommen werden (das pickup)
	if _has_been_added:
		return
	# jede Szene mit einem Inventar darin sollte in der "Inventarbesitzer" Gruppe sein
	if area not in get_tree().get_nodes_in_group("Inventarbesitzer"):
		return
	# ist die kollidierende area in der "Inventarbesitzer" Gruppe, so wird eine referenz zu ihrem Inventar
	# gefunden und validiert
	var inventar_referenz:Inventar = null
	for child in area.get_children():
		if child is Inventar:
			inventar_referenz = child
			
	if not is_instance_valid(inventar_referenz):
		return
	# das assoziierte item wird zum inventar hinzugefügt
	inventar_referenz.add_item(ItemID,Anzahl,ItemTextur)
	_has_been_added = true
	queue_free()
