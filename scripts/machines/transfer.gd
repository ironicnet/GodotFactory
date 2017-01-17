extends "res://scripts/machine.gd"

export(int) var totalTransferDistance = 20;

func input_ready(data):
	print("Transfer Input!")
	data.steps = 0
	working.push_front(data)
func output_ready():
	print("Transfer Output!")
func work_step():
	var toRemove = [];
	for index in range(0, working.size()):
		if (working[index].steps >= totalTransferDistance):
			output.push_front(working[index])
			toRemove.push_front(index);
			emit_signal("output")
			if (outNode != null):
				get_node(outNode).emit_signal("input", working[index])
		else:
			working[index].steps += 1
			prints('Transfering ',working[index].amount,working[index].recipe.resultName,(working[index].steps/totalTransferDistance)*10, working[index].steps, totalTransferDistance)
	for index in toRemove:
		working.remove(index)