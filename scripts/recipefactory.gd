extends Node

# class member variables go here, for example:
# var a = 2
var recipeRef = preload('res://scripts/recipe.gd')
var recipes = null
func _init():
	recipes = {
	0: null,
	1: recipeRef.new("Base", 30, null),
	2: recipeRef.new("Objeto", 20,[{1: 5}])
	}
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func getRecipe(code):
	if (code == null):
		print('Recipe code null')
	return recipes[code]