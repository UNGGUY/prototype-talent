class_name Player extends CharacterBody2D


@onready var canvas_layer: CanvasLayer = $CanvasLayer

const TALENT_TREE = preload("res://Scenes/talent_panel.tscn")
var is_talent_tree_open:bool = false

var direction:Vector2
var SPEED:float = 300.0

func _ready() -> void:
	canvas_layer.add_child(TALENT_TREE.instantiate())
	canvas_layer.visible = false
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("talent_tree") and not is_talent_tree_open:
		_open_talent_tree()
	elif event.is_action_pressed("talent_tree") and is_talent_tree_open:
		_close_talent_tree()



func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	
	velocity = direction * SPEED
	
	move_and_slide()
	
	
func _open_talent_tree():
	is_talent_tree_open = true
	canvas_layer.visible = true
	
	
func _close_talent_tree():
	is_talent_tree_open = false
	canvas_layer.visible = false
	
