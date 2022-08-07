extends Control

onready var _tick_button: Button = get_node("%Tick");

func _on_tick_pressed():
  TickController.tick(1.0);

func _ready():
  _tick_button.connect("pressed", self, "_on_tick_pressed");
