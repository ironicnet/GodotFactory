extends "res://scripts/machine.gd"

export(int) var currentRecipeCode;

func input_ready():
	print("Generator Input!")
func output_ready():
	print("Generator Output!")
func work_step():
	var toRemove = [];
	if (working.size()==0):
		print('creating a new working set')
		var workInfoInstance = workinfo.new(globalNode.getRecipeFactory().getRecipe(currentRecipeCode), 1)
		working.push_front(workInfoInstance)
	else: 
		for index in range(0, working.size()):
			if (working[index].steps >= working[index].totalSteps):
				prints('Produced ', working[index].amount, working[index].recipe.resultName)
				output.push_front(working[index])
				toRemove.push_front(index);
				emit_signal("output")
				if (outNode != null):
					get_node(outNode).emit_signal("input", working[index])
			else:
				working[index].steps += 1
				prints('Producing ',working[index].amount,working[index].recipe.resultName,working[index].getPercentage(), working[index].steps, working[index].totalSteps)
	for index in toRemove:
		working.remove(index)