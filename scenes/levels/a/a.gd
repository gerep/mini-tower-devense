extends Node2D

var enemy_pack: Array = []
var current_enemy_pack: int = 1

@onready var enemies_den: Node = $EnemiesDen
@onready var spawn_timer: Timer = $SpawnTimer
@onready var path_2d: Path2D = $Path2D

func _ready() -> void:
	enemy_pack.append({ GameManager.OGRE_NAME: 2 })
	enemy_pack.append({ GameManager.WILD_DOG_NAME: 5 })
	_spawn_current_pack()


func _spawn_current_pack() -> void:
	var pack: Dictionary = enemy_pack[current_enemy_pack]
	for type in pack:
		match type:
			GameManager.OGRE_NAME:
				var ogre: CharacterBody2D = GameManager.OGRE_SCENE.instantiate()
				ogre.path = path_2d
				ogre.path_offset = 0.0
				enemies_den.add_child(ogre)
			GameManager.WILD_DOG_NAME:
				for x in range(pack[type]):
					var wild_dog: CharacterBody2D = GameManager.WILD_DOG_SCENE.instantiate()
					wild_dog.path = path_2d
					wild_dog.path_offset = randf_range(30.0, 200.0)
					wild_dog.movement_speed = randf_range(0.03, 0.05)
					enemies_den.add_child(wild_dog)
