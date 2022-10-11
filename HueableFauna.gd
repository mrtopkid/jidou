extends Node2D

var base
var hueable_section

func init(path_to_asset):
	
	if path_to_asset:
		
		base = get_node("Base")
		hueable_section = get_node("HueableSection")
		
		if base && hueable_section:
		
			var texture = ImageTexture.new()
			var image = Image.new()
			image.load(path_to_asset)
			texture.create_from_image(image)

			base.texture = texture
			hueable_section.texture = texture
			
			base.region_enabled = true
			hueable_section.region_enabled = true
			
			base.region_rect = Rect2(0, 0, 32, 64)
			hueable_section.region_rect = Rect2(32, 0, 32, 64)
			
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			var red = rng.randf_range(0.7, 1)
			var green = rng.randf_range(0.7, 1)
			var blue = rng.randf_range(0.7, 1)
			hueable_section.modulate = Color(red, green, blue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
