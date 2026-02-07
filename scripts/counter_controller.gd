extends Node

# List of scene names where the counter SHOULD be hidden
var menu_scenes = [
	"res://scenes/main_menu.tscn",
	"res://scenes/level_selector.tscn",
	"res://scenes/options.tscn"
]

@onready var kill_counter = Counters.get_node("VBoxContainer/KillCounter")
@onready var button_counter = Counters.get_node("VBoxContainer/ButtonCounter")

func _ready():
	Counters.hide()
	update_ui_text()
	get_tree().node_added.connect(_on_node_added)

func update_ui_text():
	kill_counter.text = "Kills: " + str(LevelData.enemies_killed)
	button_counter.text = "Buttons: " + str(LevelData.buttons_activated)

func _on_node_added(_node):
	# Wait to ensure the new scene is set as the current_scene
	call_deferred("_check_visibility")

func _check_visibility():
	var current_scene = get_tree().current_scene
	if current_scene == null:
		return

	# Check if the current scene file path is in 'hide' list
	if current_scene.scene_file_path in menu_scenes:
		Counters.hide()
	else:
		Counters.show()
