extends Node2D

@onready var tilemap = get_node('../tilemap') as TileMap;

var tilemap_beehives: Array[Vector2i] = [];
var tilemap_flowers: Array[Vector2i] = [];
var tilemap_trees: Array[Vector2i] = [];
var tilemap_mushrooms: Array[Vector2i] = [];

const Beehive = preload("res://beehives/game/beehive.tscn");
const Flower = preload("res://beehives/game/flower.tscn");
const TreeObj = preload("res://beehives/game/tree.tscn");
const Mushroom = preload("res://beehives/game/mushroom.tscn");

func find_cell_type(tilemap: TileMap, pos: Vector2i):
	var type = 0;
	var layers = tilemap.get_layers_count();
	for i in range(layers):
		var tile = tilemap.get_cell_tile_data(i, pos);
		if (tile):
			var customdata = tile.get_custom_data('types');
			type = customdata if customdata else type;
	
	return type;

func save_cell_type(type, pos):
	match type:
		1:
			tilemap_beehives.push_back(pos);
		2:
			tilemap_flowers.push_back(pos);
		3:
			tilemap_trees.push_back(pos);
		4:
			tilemap_mushrooms.push_back(pos);
	pass;

# Called when the node enters the scene tree for the first time.
func _ready():
	var pos = Vector2i(0, 0);
	var tile = tilemap.get_cell_tile_data(0, pos);
	while(tile):
		while(tile):
			var type = find_cell_type(tilemap, pos);
			save_cell_type(type, pos);
			pos.x += 1;
			tile = tilemap.get_cell_tile_data(0, pos);
			
		pos.x = 0;
		pos.y += 1;
		tile = tilemap.get_cell_tile_data(0, pos);
		
	print(tilemap_beehives, tilemap_flowers);
	propogate_subscenes(tilemap, tilemap_beehives, Beehive);
	propogate_subscenes(tilemap, tilemap_flowers, Flower);
	propogate_subscenes(tilemap, tilemap_trees, TreeObj);
	propogate_subscenes(tilemap, tilemap_mushrooms, Mushroom);
	pass # Replace with function body.

func propogate_subscenes(tilemap, positions, scene):
	for pos in positions:
		var localpos = tilemap.map_to_local(pos);
		var child = scene.instantiate();
		child.position = localpos;
		tilemap.add_child(child);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
