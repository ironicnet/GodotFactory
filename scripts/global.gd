extends Node

signal work_step

var timer
var recipeFactory = null
var gameManager

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print('Global ready!')
	recipeFactory = preload('res://scripts/recipefactory.gd').new()
	gameManager = preload('res://scripts/gamemanager.gd').new()
func _timer_callback():
	print('Callback')
	emit_signal("work_step")
func getRecipeFactory():
	return recipeFactory;