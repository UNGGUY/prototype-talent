class_name TalentButton extends Button

@onready var texture_rect: TextureRect = $TextureRect
@onready var talent_label: Label = $Label
@onready var panel: Panel = $Panel
@onready var line_2d: Line2D = $Line2D



@export var talent:Talent

var level : int = 0 :
	set(value):
		level = value
		talent.level = level
		talent_label.text = str(level) + "/" + str(talent.maxlevel)


func _ready() -> void:
	texture_rect.texture = talent.icon
	
	if get_parent() is TalentButton:
		line_2d.add_point(global_position+size/2)
		line_2d.add_point(get_parent().global_position + size/2)
		
	
	


func _on_pressed() -> void:
	level = min(level+1,talent.maxlevel)
	panel.show_behind_parent = true
