extends Node2D


export (int) var x_width
export (int) var y_width

onready var ground_tiles: TileMap = $GroundTileMap
onready var chunk_tiles: TileMap = $ChunkTileMap

var chunk_noise

var rng = RandomNumberGenerator.new()

var loaded = 0

func _ready():
	generate_ground()

func generate_ground():
	var noise = OpenSimplexNoise.new()
	randomize()
	noise.seed = randi()
	noise.octaves = 4
	noise.period = 20.0
	noise.persistence = 0.8
	
	for x in range(x_width):
		if(int(map_range(x, 0.0, 100.0, x_width, y_width)) % 10 == 0):
			loaded += 10
			print(loaded)
		for y in range(y_width):
			var noise_value = noise.get_noise_2d(x, y)
			if -0.5 <= noise_value and noise_value <= 0.0:
				ground_tiles.set_cell(x, y, rng.randi_range(0, 4))
				if rng.randi_range(0, 10) == 0:
					create_hueable_fauna((x * 32) + 16,(y * 32) + 16,"res://Game/World/Assets/Fauna/Tree1.png")
			elif 0.0 <= noise_value and noise_value <= 0.3:
				ground_tiles.set_cell(x, y, rng.randi_range(5, 8))
			elif 0.3 <= noise_value and noise_value <= 0.6:
				ground_tiles.set_cell(x, y, 0)

func generate_chunks():
	pass
	
func create_hueable_fauna(x, y, asset_path):
	var fauna = preload("res://Game/World/Fauna/HueableFauna.tscn").instance()
	fauna.init(asset_path)
	fauna.position = Vector2(x,y)
	add_child(fauna)
	
	
func map_range(value, min1, max1, min2, max2):
	var value_norm = inverse_lerp(min1, max1, value)
	return lerp( min2, max2, value_norm)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
