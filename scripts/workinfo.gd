export(int) var steps = 0
export(Object) var data;
export(Object) var recipe;
export(int) var amount;


func _init(_recipe, _amount):
	recipe = _recipe
	amount = _amount