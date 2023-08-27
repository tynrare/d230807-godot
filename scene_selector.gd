@tool
extends Node2D

@export var scene_path: Array[PackedScene];
@export var active_scene: int = 0: set = _set_active_scene;

# Called when the node enters the scene tree for the first time.
func _ready():
	load_scene(active_scene);
	pass # Replace with function body.

func _set_active_scene(value):
	active_scene = value;
	load_scene(active_scene);

func load_scene(index):
	for c in $scene_container.get_children():
		c.queue_free();
		
	if (scene_path[index]):
		var instance = scene_path[index].instantiate();
		$scene_container.add_child(instance);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_property_list_changed():
	load_scene(active_scene);
	pass # Replace with function body.
