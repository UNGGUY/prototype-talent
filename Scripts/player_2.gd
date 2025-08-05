class_name Player2 extends CharacterBody2D

var is_talent_tree_open:bool = false

var direction:Vector2
var SPEED:float = 300.0

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	pass



func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	
	velocity = direction * SPEED
	
	move_and_slide()
	
	
	
