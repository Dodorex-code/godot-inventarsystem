🇩🇪 Installation und Setup:


0. Vorraussetzung: Du hast bereits ein Godot Projekt mit einem Spieler
1. lade die zip-Datei herunter und extrahiere ihren inhalt in den "addons"-Ordner in deinem Godot Projekt (hast du noch keinen, so erstellen einen Ordner mit dem namen "addons")
2. Unter Projekt -> Projekteinstellungen -> Plugins musst du "EinfachesInventarsystem" aktivieren
3. In deiner Spieler-Szene fügst du nun das Inventar als Child-Node hinzu. Du findest es unter : res://addons/einfachesinventarsystem/inventar.tscn
4. Wenn du auf den Inventar Node klickst und auf der rechten seite unter Node -> Signale mit einem Doppelklick oder einem Rechtsklick auf "item_used(itemID:int)" verbinden
5. Später kannst du dort überprüfen was passieren soll (z.B. wenn item mit itemID 4 genutzt wurde, dann ...)
6. Um nun items zu erstellen, musst du die Pickup-Szene in dein Level ziehen, du findest sie unter: res://addons/einfachesinventarsystem/pickup.tscn
7. Deinem Item gibst du eine Textur, die Anzahl dieses Items die durch das Aufnehmen dieses Pickups hinzugefügt wird und die itemID, welche ein Item klar identifizieren soll



🇩🇪 Zusätzliche Funktionen:
Die Inventar Szene hat einige Funktionen um mit dem Inventar auch programmatisch zu interagieren.
| Funktion | Effekt |
| :---: | --- |
| `add_item(itemID, ammount, item_texture)` | fügt ein item mit einer itemID, einer Anzahl und einer Textur dem inventar hinzu |
| `remove_item(itemID, ammound)` | geht durch alle items und entfernt die spezifizierte Anzahl von dem item mit dieser itemID |
| `delete_item(itemID)` | entfernt alle Items mit dieser itemID |
| `has_enough_of(itemID, needed_ammount)` | überprüft ob von einem spezifizierten Item mindestens eine gewisse anzahl vorhanden ist und gibt einen bool zurück |




🇬🇧 Installation and setup:


0. Prerequisite: You already have a Godot project with a player.
1. Download the zip file and extract its contents into the "addons" folder in your Godot project (if you don't have one, create a folder named "addons").
2. Under Project -> Project Settings -> Plugins, you must enable "EinfachesInventarsystem"
3. Now add the inventory as a child node in your player scene. You can find it at: res://addons/einfachesinventarsystem/inventar.tscn
4. If you click on the inventory node and on the right side under Node -> Signals, double-click or right-click on "item_used(itemID:int)"
5. Later, you can check what should happen there (e.g., if an item with itemID 4 was used, then...)
6. To create items, you need to drag the pickup scene into your level. You can find it at: res://addons/einfachesinventarsystem/pickup.tscn
7. You give your item a texture, the quantity of this item that will be added by picking up this pickup, and the itemID, which should clearly identify an item.



🇬🇧 Additional functionality:
The inventory scene has several functions for interacting with the inventory programmatically.
| Function | Effect |
| :---: | --- |
| `add_item(itemID, ammount, item_texture)` | Adds an item with an itemID, a quantity, and a texture to the inventory |
| `remove_item(itemID, ammound)` | Iterates through all items and removes the specified quantity from the item with this itemID |
| `delete_item(itemID)` | Removes all items with this itemID |
| `has_enough_of(itemID, needed_ammount)` | Checks whether at least a certain quantity of a specified item is present and returns a bool |
