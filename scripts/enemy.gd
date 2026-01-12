class_name Enemy
extends CharacterBody2D

@export var movement_speed: float = 40.0
@export var path: Path2D

var path_follow: PathFollow2D
var path_offset: float


func _ready() -> void:
    path_follow = PathFollow2D.new()
    path.add_child(path_follow)
    path_follow.progress = path_offset


func _process(delta: float) -> void:
    path_follow.progress_ratio += movement_speed * delta
    position = path_follow.position
