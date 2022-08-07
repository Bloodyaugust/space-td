extends Node

signal enter_tick;
signal generate_resources;
signal construct;
signal combat;
signal exit_tick;

func tick(delta: float):
  emit_signal("enter_tick", delta);
  print("enter_tick complete");
  emit_signal("generate_resources", delta);
  print("generate_resources complete");
  emit_signal("construct", delta)
  print("construct complete");
  emit_signal("combat", delta);
  print("combat complete");
  emit_signal("exit_tick", delta);
  print("exit_tick complete");
