extends Node

@onready var player = AudioStreamPlayer.new()

var songs = [
	preload("res://sergequadrado-cool-hip-hop-loop-251857.mp3"),
	preload("res://freesound_community-cottagecore-17463.mp3"),
	preload("res://sergequadrado-indie-game-soundtrack-251864.mp3"),
	preload("res://sergequadrado-smooth-loop-251873.mp3"),
	preload("res://sergequadrado-tutorial-loop-251874.mp3"),
	preload("res://sergequadrado-funky-and-jazzy-gang-loop-251858.mp3")
]

var last_song := -1

func _ready():
	randomize()

	add_child(player)
	player.bus = "Music"

	player.finished.connect(_play_random)

	_play_random()

func _play_random():
	var random_index := last_song

	while random_index == last_song:
		random_index = randi() % songs.size()

	last_song = random_index
	player.stream = songs[random_index]
	player.play()
