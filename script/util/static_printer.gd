class_name StaticPrinter

extends Object

static func print(message: String, invoker: Object) -> void:
	print(str(invoker, " -> ", message))
