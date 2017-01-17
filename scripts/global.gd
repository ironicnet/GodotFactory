extends Node


const recipeFactory = preload('res://scripts/recipefactory.gd')

var recipeFactoryInstance

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print('Global ready!')
	recipeFactoryInstance = recipeFactory.new()
	add_child(recipeFactoryInstance)
func getRecipeFactory():
	return recipeFactoryInstance;