extends Node2D

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
	print('Connecting to game manager')
	gameManagerNode.connect("work_step", self, "work_step")
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func input_ready():
	print("Machine Input!")
func output_ready():
	print("Machine Output!")
func work_step():
	print('Machine not extended')