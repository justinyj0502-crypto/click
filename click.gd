extends Control

signal buy_click(name)

@onready var s = $"."
@onready var game = get_tree().current_scene
@onready var cakecount = $cake
@onready var pruj =  $"유제2"
@onready var prjj = $"전조2"

func close() -> void:
	s.visible = false

func _on_유제_pressed() -> void:
	buy_click.emit("uj")
func _on_전조_pressed() -> void:
	buy_click.emit("jj")
func _on_신도_pressed() -> void:
	buy_click.emit("sd")

func _ready():
	game.ck.connect(cake)
	game.ujpr.connect(pru)
	game.sdpr.connect(prs)
	game.jjpr.connect(prj)
	Global.cake_changed.connect(update)
	update()
func cake(cake):
	cakecount.text = "케이크: " + str(snapped(cake,1))
func pru(pru):
	pruj.text = str(snapped(pru,1)) + "cake🍰"
func prs(prs):
	$"신도2".text= str(snapped(prs,1)) + "cake🍰"
func prj(prj):
	prjj.text = str(snapped(prj,1)) + "cake🍰"
func update(_cake = 0):
	cakecount.text = "케이크: " + str(snapped(Global.cake, 1))
