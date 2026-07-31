extends Node

signal cake_changed(value)


var cake := 300
var cc := 1      # 클릭당 케이크
var cp := 0     # 알바(CPS)

func add_cake(amount):
	cake += amount
	cake_changed.emit(cake)

func spend_cake(amount):
	if cake >= amount:
		cake -= amount
		cake_changed.emit(cake)
		return true
	return false
