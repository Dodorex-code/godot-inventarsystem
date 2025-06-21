class_name Inventar extends Control

@warning_ignore("unused_signal")
signal item_used(itemID:int)

## wie viele spalten soll das Inventar haben
@export var columns:int = 4
## wie viele reihen soll das Inventar haben
@export var rows:int = 4

@onready var item_scene = preload("res://addons/einfachesinventarsystem/Inventar/item.tscn")

@onready var grid_container: GridContainer = $GridContainer

func _ready() -> void:
	# füllt den grid_container mit "leeren" Items
	# gibt jedem leeren item eine referenz zu sich selbst (für das benutzten von items)
	grid_container.columns = columns
	for _i in range(int(columns*rows)):
		var new_item:Item = item_scene.instantiate()
		new_item.inventar_referenz = self
		new_item.itemID = -1
		grid_container.add_child(new_item)
	
	# gibt es noch kein InputMapping um das Inventar zu öffnen, so wird "invenar" mit " I " hinzugefügt
	if not "inventar" in InputMap.get_actions():
		InputMap.add_action("inventar")
		var ev = InputEventKey.new()
		ev.keycode = KEY_I
		InputMap.action_add_event("inventar", ev)
	
	# anfangs ist das Inventar und der Cursor nicht sichtbar
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	get_owner().add_to_group("Inventarbesitzer")

func _process(_delta:float) -> void:
	# wird "inventar" gedrückt, so wechselt sich ab, ob das Inventar und der Cursor sichbar sind oder nicht
	if Input.is_action_just_pressed("inventar"):
		visible = !visible
		if visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

## fügt items ins inventar
func add_item(itemID:int, ammount:int=1, item_texture:Texture2D=null) -> void:
	var items = grid_container.get_children()
	for item:Item in items:
		# erst wird geschaut ob es bereits ein item mit dieser itemID in dem Inventar gibt
		# fall ja, dann wird die anzahl lediglich dem existierenden item hinzigefügt
		if item.itemID == itemID:
			if item_texture == null:
				push_error("Invalid item_texture. Cannot add to existing item " + str(itemID) + "to inventar")
				get_tree().quit(-1)
			else:
				item.add_item(ammount)
				return
	for item:Item in items:
		# wurde kein item mit dieser itemID gefunden, so wird der erste "leere" Item Slot genutzt
		# und das Item wird mit anzahl und Textur dort "hinplaziert"
		if item.is_empty:
			if item_texture == null:
				push_error("Invalid item_texture. Cannot add new item " + str(itemID) + "to inventar")
				get_tree().quit(-1)
			else:
				item.itemID = itemID
				item.add_item(ammount, item_texture)
				return

## geht durch alle items und entfernt die spezifizierte Anzahl von dem item
func remove_item(itemID:int, ammount:int=1) -> void:
	var items = grid_container.get_children()
	for item:Item in items:
		if item.itemID == itemID:
			item.remove_item(ammount)
			
## geht durch alle items und setzt die anzahl des gesuchten items auf 0 und "leert" somit den Item Slot
func delete_item(itemID:int) -> void:
	var items = grid_container.get_children()
	for item:Item in items:
		if item.itemID == itemID:
			item.remove_item(item.stack)

## überprüft ob ein spezifiziertes Item mindestens eine gewisse anzahl hat
func has_enough_of(itemID:int, needed_ammount:int) -> bool:
	var items = grid_container.get_children()
	for item:Item in items:
		if item.itemID == itemID:
			if item.stack >= needed_ammount:
				return true
	return false
