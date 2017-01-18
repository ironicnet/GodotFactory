extends "res://scripts/machine.gd"

export(int) var currentRecipeCode;
var workAmount = 1
var startItemPos
var endItemPos
func _ready():
	
	startItemPos = get_pos()
	endItemPos = Vector2(get_pos().x+16, get_pos().y);
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
				working[index].steps += workAmount
				prints('Producing ',working[index].amount,working[index].recipe.resultName,working[index].getPercentage(), working[index].steps, working[index].totalSteps)
				_updateNode(working[index])
						
						
	for index in toRemove:
		working.remove(index)
func _updateNode(workinfo):
	if (workinfo.getPercentage() >= 0.1 ):
		if (workinfo.node == null):
			var node = Sprite.new()
			node.set_texture(workinfo.texture)
			node.set_pos(startItemPos)
			add_child(node)
			workinfo.node = node.get_path();
		else:
			var currentPos = get_pos()
			prints('Moving', currentPos, Vector2(currentPos.x + workinfo.getPercentage() * 16, currentPos.y))
			get_node(workinfo.node).set_pos(Vector2(startItemPos.x + workinfo.getPercentage() * 16, currentPos.y))