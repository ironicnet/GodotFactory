export(int) var totalSteps
export(String) var resultName
export(Texture) var resultTexture


func _init(name, steps, requirements, texture):
	totalSteps = steps
	resultName = name
	resultTexture = texture