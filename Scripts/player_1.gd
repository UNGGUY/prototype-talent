class_name Player1 extends CharacterBody2D


@export var character_resource:CharacterResource
@onready var canvas_layer: CanvasLayer = $CanvasLayer

const TALENT_TREE = preload("res://Scenes/talent_panel.tscn")
var is_talent_tree_open:bool = false

var direction:Vector2
var SPEED:float = 300.0

var DASH_SPEED:float = 1200.0





func _ready() -> void:
	canvas_layer.add_child(TALENT_TREE.instantiate())
	canvas_layer.visible = false
	TalentUtilis.talent_change.connect(update_character_resource)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("talent_tree") and not is_talent_tree_open:
		_open_talent_tree()
	elif event.is_action_pressed("talent_tree") and is_talent_tree_open:
		_close_talent_tree()



func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	
	velocity = direction * SPEED
	
	
	if Input.is_action_pressed("dash") and character_resource.talents[1]:
		velocity = velocity.normalized()
		velocity.x = direction.x * DASH_SPEED
		velocity.y = direction.y * DASH_SPEED
	
	move_and_slide()
	
	
func _open_talent_tree():
	is_talent_tree_open = true
	canvas_layer.visible = true
	
	
func _close_talent_tree():
	is_talent_tree_open = false
	canvas_layer.visible = false
	
	
func update_character_resource(talent:Talent)->void:
	character_resource.talents[talent.id]=talent
