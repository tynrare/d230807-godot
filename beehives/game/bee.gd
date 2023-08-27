extends Node2D

enum BehaveMode { MODE_IDLE, MODE_TO_TARGET }
var time = 0;
var target: Vector2;
var mode: BehaveMode = BehaveMode.MODE_IDLE

# Called when the node enters the scene tree for the first time.
func _ready():
	target.x = position.x;
	target.y = position.y;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta;
	match (mode):
		BehaveMode.MODE_IDLE:
			var x = cos(time);
			var y = sin(time);
			target.x += x;
			target.y += y;
	
	position.x = lerp(position.x, target.x, 0.5);
	position.y = lerp(position.y, target.y, 0.5);
	pass


func _on_area_2d_area_entered(area):
	if (area.is_in_group("gameobj_flower")):
		#mode = BehaveMode.MODE_TO_TARGET;
		#target.x = area.global_position.x
		#target.y = area.global_position.y;
		pass # Replace with function body.


func _on_area_2d_area_exited(area):
	if (area.is_in_group("gameobj_flower")):
		mode = BehaveMode.MODE_IDLE;
	pass # Replace with function body.
