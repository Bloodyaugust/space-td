extends Node2D

export var data: Resource;

onready var sprite: Sprite = $"./Sprite";

var _build_progress: float = 0;
var _built: bool = false;
var _health: float = 0;
var _target: Node2D;

func _on_tick_construct(delta: float):
  if !_built:
    _build_progress = clamp(_build_progress + delta, 0, data.build_time);
    
    if _build_progress >= data.build_time:
      _built = true;
      print("finished building");

func _on_tick_generate_resources(delta: float):
  if _built && (data.energy_generated > 0 || data.mining_rate > 0):
    ResourceController.resources.energy += data.energy_generated * delta;
    print(ResourceController.resources.energy);
# TODO: Add mining code

func _ready():
  sprite.texture = data.sprite;
  
  TickController.connect("construct", self, "_on_tick_construct");
  TickController.connect("generate_resources", self, "_on_tick_generate_resources");
