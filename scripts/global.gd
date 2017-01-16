extends Node

signal work_step

const recipeFactory = preload('res://scripts/recipefactory.gd')
const gameManager = preload('res://scripts/gamemanager.gd')

var gameManagerInstance
var recipeFactoryInstance

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print('Global ready!')
	recipeFactoryInstance = recipeFactory.new()
	gameManagerInstance = gameManager.new()
	gameManagerInstance._ready()
func getRecipeFactory():
	return recipeFactoryInstance;
func getGameManager():
	return gameManagerInstance;