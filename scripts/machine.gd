extends Node

signal output
signal input
signal work
const workinfo = preload("res://scripts/workinfo.gd")
const item = preload("res://scripts/item.gd")
const work_types = {
	"TRANSFER": 0,
	"PROCESS": 1
}
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(NodePath) var outNode;
export(String) var workType;

export(int) var totalTransferDistance;
export(int) var currentRecipeCode;

var input = [];
var working = [];
var output = [];
var gameManagerNode
var globalNode

func _ready():
	connect("input", self, "input_ready")
	connect("output", self, "output_ready")
	globalNode = get_node("/root/global")
	gameManagerNode = get_node("/root/gamemanager")
	gameManagerNode.connect("work_step", self, "work_step")
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func output_ready():
	print("Output!")
func work_step():
	if (workType == work_types.TRANSFER):
		doTransferWork()
	elif (workType == work_types.GENERATE):
		doGenerateWork()
func doTransferWork():
	var toRemove = [];
	for index in range(0, working.size()):
		if (working[index].info.steps >= totalTransferDistance):
			output.push_front(working[index].data)
			toRemove.push_front(index);
			emit_signal("output")
			if (outNode != null):
				outNode.emit_signal("input")
	for index in toRemove:
		working.remove(index)
func doGenerateWork():
	var toRemove = [];
	if (working.size()==0):
		var workInfoInstance = workinfo.new(globalNode.getRecipeFactory().getRecipe(currentRecipeCode))
		working.push_front(workInfoInstance)
	else: 
		for index in range(0, working.size()):
			if (working[index].steps >= working[index].info.recipe.totalSteps):
				var result = item.new(working[index].info.recipe.resultName)
				output.push_front(result)
				toRemove.push_front(index);
				emit_signal("output")
				if (outNode != null):
					outNode.emit_signal("input")
	for index in toRemove:
		working.remove(index)