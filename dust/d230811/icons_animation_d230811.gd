extends AnimatedSprite2D

var initial_scale: Vector2;
@export var linked: Array[NodePath];
var detained = false;
var detained_animation = animation;
var detained_frame = 0;
var selfscene = preload('res://dust/d230811/icons_animation_d230811.tscn');

# Called when the node enters the scene tree for the first time.
func _ready():
	play(detained_animation);
	initial_scale = scale;
	pass # Replace with function body.

func mutate_linked(anim):
	for path in linked:
		if path:
			var node = get_node(path) as AnimatedSprite2D;
			if !node.detained:
				node.play(anim);

func turnon_phase():
	
	if detained:
		return;
		
	var animations = sprite_frames.get_animation_names();
	var anim = animations[frame + 1] if detained_animation == 'default' else 'default';
	detained_animation = animation;
	detained_frame = frame;
	play(anim);
	
	scale = initial_scale * 1.3;
	
	pass;
	
func turnoff_phase():
	if detained:
		return;
		
	play(detained_animation);
	frame = detained_frame;
	scale = initial_scale * 1;
		
	pass;
	

func toggle_detain():
	detained = !detained;
	detain(detained);

func detain(d: bool):
	scale = initial_scale * (1.4 if d else 1);
	pause() if d else play(animation);
	detained = d;
	#var animations = sprite_frames.get_animation_names();
	#var anim = animations[frame + 1] if detained_animation == 'default' else 'default';
	#mutate_linked(anim);

#func set_tint(tint: bool):
#	(material as ShaderMaterial).set_shader_parameter("tint", tint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
