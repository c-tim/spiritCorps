class_name ProgressBar_Health extends Control

const STEP_PROGRESS_BAR = 5

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar

var progressbar_value : int :
	get :
		return texture_progress_bar.value
	set(value):
		progressbar_value = value
		texture_progress_bar.value = value
		
var objective_value :int


func _ready() -> void:
	objective_value = 15

func _process(delta: float) -> void:
	if progressbar_value != objective_value :
		if abs(progressbar_value-objective_value)>=STEP_PROGRESS_BAR:
			progressbar_value =  move_toward(progressbar_value, objective_value, STEP_PROGRESS_BAR)
		else :
			progressbar_value = objective_value

func set_progressbar_value(value:int):
	objective_value = value
