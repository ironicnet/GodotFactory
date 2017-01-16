extends Node

# class member variables go here, for example:
# var a = 2
var recipeRef = preload('res://scripts/recipe.gd')
var recipes = {
	0: null,
	1: recipeRef.new("Base", 10, null),
	2: recipeRef.new("Objeto", 20,[{1: 5}])
}
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func getRecipe(code):
	return recipes[code]