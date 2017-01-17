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
		var workInfoInstance = workinfo.new(globalNode.getRecipeFactory().getRecipe(currentRecipeCode))
		working.push_front(workInfoInstance)
	else: 
		for index in range(0, working.size()):
			if (working[index].steps >= working[index].recipe.totalSteps):
				print('work done!')
				var result = item.new(working[index].recipe.resultName)
				output.push_front(result)
				toRemove.push_front(index);
				emit_signal("output")
				if (outNode != null):
					get_node(outNode).emit_signal("input", result)
			else:
				working[index].steps += 1
				print('work added!')
	for index in toRemove:
		working.remove(index)