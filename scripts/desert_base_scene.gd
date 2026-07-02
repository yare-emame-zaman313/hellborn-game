extends Node3D

# Desert Base Scene Script
# Phase 1 - Level 2: Midnight operation at abandoned base near Isfahan

@export var scene_name: String = "Desert Base - Midnight Raid"
@export var time_of_day: String = "00:00 (Midnight)"
@export var weather: String = "Clear Night Sky"
@export var operational_radius_km: float = 1.0

# Camera settings for night vision effect
@export var ambient_light_strength: float = 0.3
@export var moon_light_strength: float = 0.4

func _ready() -> void:
	print("Scene: %s" % scene_name)
	print("Time: %s" % time_of_day)
	print("Weather: %s" % weather)
	print("Operational Radius: %d km" % int(operational_radius_km))
	
	# Setup night environment
	setup_night_environment()
	
	# Initialize terrain
	setup_terrain()
	
	# Setup objective display
	display_objective()

func setup_night_environment() -> void:
	# Configure lighting for night scene
	var directional_lights = get_tree().get_nodes_in_group("night_lights")
	for light in directional_lights:
		if light is DirectionalLight3D:
			light.light_energy_multiplier = moon_light_strength

func setup_terrain() -> void:
	# Terrain setup
	print("Setting up desert terrain...")
	print("- Base terrain (2km x 2km sand)")
	print("- 4 surrounding hills creating enclosed area")
	print("- Ruined military base in center")
	print("- Dirt road from north entrance")

func display_objective() -> void:
	var objective_text = get_node_or_null("UI/ObjectiveText")
	if objective_text:
		objective_text.text = """[Briefing Report]

Helicopter insertion detected at abandoned base, south of Isfahan.
Enemy forces engaged. Civilian reports confirm Hellborn operation.

OBJECTIVE: Reach the abandoned base and neutralize threats.
OPERATIONAL RADIUS: 1km from base perimeter.
TERRAIN: Desert, surrounded by 4 protective hills.
TIME: Midnight (0000 hours) - Clear skies.

Press any key to begin operation..."""

func _process(_delta: float) -> void:
	# Can be used for scene-specific updates
	pass

func _on_objective_zone_entered(zone: String) -> void:
	print("Player entered zone: %s" % zone)

func _on_objective_completed(objective: String) -> void:
	print("Objective completed: %s" % objective)
