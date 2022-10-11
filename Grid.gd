extends Resource

export var WorldSize := Vector2(40,40)
export var CellSize := Vector2(20,20)

var CenterCellPos = CellSize / 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func CalMapPos(GridPos: Vector2) -> Vector2:
	return GridPos * CellSize + CenterCellPos

func CalGridCoord(MapPos: Vector2) -> Vector2:
	return (MapPos / CellSize).floor()

func IsInsideWorld(Coords: Vector2) -> bool:
	var out := Coords.x >= 0 and Coords.x < WorldSize.x
	return out and Coords.y >= 0 and Coords.y < WorldSize.y

func GridClamp(GridPos: Vector2) -> Vector2:
	var out := GridPos
	out.x = clamp(out.x, 0, WorldSize.x - 1)
	out.y = clamp(out.y, 0, WorldSize.y - 1)
	return out

func PosAsArray(Cell: Vector2) -> int:
	return int(Cell.x + WorldSize.x * Cell.y)


#func _process(delta):
#	pass
