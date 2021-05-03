extends YSort

onready var p1 = get_node("../P1")
onready var point_marker = get_node("point_marker")

func _process(delta):
	point_marker.text = str(p1.points)
