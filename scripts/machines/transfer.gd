extends "res://scripts/machine.gd"

export(int) var totalTransferDistance = 20;
var transferAmount = 1

func input_ready(data):
	print("Transfer Input!")
	data.steps = 0
	data.totalSteps = totalTransferDistance
	working.push_front(data)
func output_ready():
	print("Transfer Output!")
func work_step():
	var toRemove = [];
	for index in range(0, working.size()):
		if (working[index].steps >= working[index].totalSteps):
			output.push_front(working[index])
			toRemove.push_front(index);
			emit_signal("output")
			if (outNode != null):
				get_node(outNode).emit_signal("input", working[index])
		else:
			working[index].steps += transferAmount
			prints('Transfering ',working[index].amount,working[index].recipe.resultName,working[index].getPercentage(), working[index].steps, working[index].totalSteps)
	for index in toRemove:
		working.remove(index)