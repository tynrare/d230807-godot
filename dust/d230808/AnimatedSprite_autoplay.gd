extends AnimatedSprite2D

var initial_scale: Vector2;
var detained = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	play('default');
	initial_scale = scale;
	pass # Replace with function body.

func set_highlighted(high: bool):
	scale = initial_scale * (1.1 if high else 1);

#func set_tint(tint: bool):
#	(material as ShaderMaterial).set_shader_parameter("tint", tint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
