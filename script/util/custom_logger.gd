class_name CustomLogger

extends Object

var data : Array = []

func log() -> String:
	return array_to_string(data)

func string(value: String) -> CustomLogger:
	data.append(value)
	return self
	
func float(value: float) -> CustomLogger:
	data.append(value)
	return self

func array_to_string(arr: Array) -> String:
	var s = ""
	for value in arr:
		s += str(value)
	return s
