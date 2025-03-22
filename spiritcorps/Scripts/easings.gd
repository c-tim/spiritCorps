class_name Easings extends Node


static func bezier(x : float, n : int)-> float:
	return 1 - pow(1 - x, n);
