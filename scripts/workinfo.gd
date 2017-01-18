export(int) var steps = 0
export(int) var totalSteps = 0
export(Object) var data;
export(Object) var recipe;
export(int) var amount;
export(NodePath) var node;
export(Texture) var texture;


func _init(_recipe, _amount):
	recipe = _recipe
	totalSteps = recipe.totalSteps
	amount = _amount
	texture = _recipe.resultTexture
func getPercentage():
	var percentage = (float(steps) / totalSteps)
	return percentage