extends Node

signal cake_changed(value)


var cake := 0
var cc := 1 # 클릭당 케이크
var cp := 0     # 알바(CPS)
var gt = 0
var ov = 0
var bt = 0
var bb = 0
var sh = 0
var pru = 50
var prj = 600
var pbt = 25000000
var pth = 120000
var prs = 8000
var pgh = 60000000




func add_cake(amount):
	cake += amount
	cake_changed.emit(cake)
	save_game()

func spend_cake(amount):
	if cake >= amount:
		cake -= amount
		cake_changed.emit(cake)
		save_game()
		return true
	return false
func format_number(num: float) -> String:
	var units = ["", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No"]

	var index := 0

	while num >= 1000.0 and index < units.size() - 1:
		num /= 1000.0
		index += 1

	if index == 0:
		return str(int(num))

	if num >= 100:
		return "%d%s" % [int(num), units[index]]
	elif num >= 10:
		return "%.1f%s" % [num, units[index]]
	else:
		return "%.2f%s" % [num, units[index]]



func save_game():
	var save_data = {
		"cake": Global.cake,
		"cc": Global.cc,
		"cp": Global.cp,
		"gt": Global.gt,
		"ov": Global.ov,
		"bt": Global.bt,
		"bb": Global.bb,
		"sh": Global.sh,
		"prs": Global.prs,
		"pru": Global.pru,
		"prj": Global.prj,
		"pgh": Global.pgh,
		"pth": Global.pth,
		"pbt": Global.pbt
	}

	var file = FileAccess.open("user://save.save", FileAccess.WRITE)
	file.store_var(save_data)
	file.close()
	
func load_game():
	if !FileAccess.file_exists("user://save.save"):
		return

	var file = FileAccess.open("user://save.save", FileAccess.READ)
	var save_data = file.get_var()
	file.close()

	cake = save_data["cake"]
	cc = save_data["cc"]
	cp = save_data["cp"]
	gt = save_data["gt"]
	ov = save_data["ov"]
	bt = save_data["bt"]
	bb = save_data["bb"]
	sh = save_data["sh"]

	pru = save_data["pru"]
	prj = save_data["prj"]
	prs = save_data["prs"]
	pth = save_data["pth"]
	pbt = save_data["pbt"]
	pgh = save_data["pgh"]

	cake_changed.emit(cake)

func reset_game():
	if FileAccess.file_exists("user://save.save"):
		DirAccess.remove_absolute("user://save.save")

	cake = 0
	cc = 1
	cp = 0

	gt = 0
	ov = 0
	bt = 0
	bb = 0
	sh = 0

	pru = 50
	prj = 600
	prs = 8000
	pth = 120000
	pbt = 25000000
	pgh = 60000000

	cake_changed.emit(cake)
	save_game()
