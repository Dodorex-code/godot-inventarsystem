class_name Item extends Control

var is_empty:bool = true
## einzigartige Identfikationsnummer für das Item
var itemID:int = -2
## anzahl dieses items in diesem Item Slot
var stack:int = 0
var inventar_referenz:Inventar;

@onready var label: Label = $Label
@onready var texture_rect: TextureRect = $TextureRect
@onready var button: Button = $Button

## entfernt die spezifierte Anzahl dieses Items wenn möglich
func remove_item(ammount:int = 1) -> bool:
	if not is_empty:
		inventar_referenz.item_used.emit(itemID)
		if stack-ammount > 0:
			stack -= ammount
			label.text = str(stack)
			return true
		elif stack-ammount == 0:
			is_empty = true
			label.text = ""
			texture_rect.texture = null
			button.disabled = true
			return true
	return false

func _on_button_pressed() -> void:
	remove_item()

## fügt die spezifierte Anzahl dieses Items diesem Item Slot zu
func add_item(ammount:int=1, item_texture:Texture2D=null) -> void:
	if is_empty:
		is_empty = false
		button.disabled = false
	if item_texture != null:
		texture_rect.texture = item_texture
	stack += ammount
	label.text = str(stack)
