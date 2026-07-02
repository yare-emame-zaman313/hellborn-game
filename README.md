# Hellborn Game 🎮

## Overview
**Hellborn Game** is a first-person shooter (FPS) game set in an Iranian military base near Isfahan, depicting a night operation against hostile forces attempting a helicopter assault.

## Story
You play as an Iranian military defender fighting against American special forces (Operation: Hellborn) attempting a surprise attack on an abandoned military base in the southern desert of Isfahan at midnight.

## Game Structure

### Phase 1: Initial Deployment

#### Scene 1: Military Command Center
- **Location**: Iranian military command center
- **Objective**: Receive briefing about the Hellborn operation and prepare for deployment
- **Mechanics**: 
  - Dialogue/briefing system
  - Equipment selection interface
  - Team assignment system

#### Scene 2: Desert Base - Midnight Raid (Current)
- **Location**: Abandoned military base surrounded by 4 hills
- **Time**: Midnight (00:00 hours)
- **Weather**: Clear night sky
- **Terrain**: Desert environment with dirt roads, ruined structures, protective hills
- **Operational Radius**: 1km from base

## Current Features

### Environment
- 2km x 2km sandy desert terrain
- 4 protective hills surrounding the base
- Ruined military base structures
- Dirt roads leading to the base
- Night time lighting with moon illumination

### Player Mechanics
- **Movement**: WASD (Walk/Sprint with Shift)
- **Camera**: Mouse look
- **Speed**: 
  - Normal: 7 m/s
  - Sprint: 12 m/s
- **Jump**: Spacebar

## Technical Details

- **Engine**: Godot 4.6.0
- **Language**: GDScript
- **Scene System**: Modular scene-based architecture

## File Structure

```
hellborn-game/
├── scenes/
│   └── desert_base.tscn          # Desert base level scene
├── scripts/
│   ├── desert_base_scene.gd      # Scene manager
│   └── player_controller.gd      # FPS player controller
├── assets/
│   ├── materials/
│   │   ├── sand_material.tres
│   │   └── night_sky_material.tres
│   ├── models/
│   └── sounds/
└── project.godot                  # Project configuration
```

## Development Roadmap

### Phase 1: Deployment & Base Infiltration
- [x] Scene 1: Command center briefing
- [x] Scene 2: Desert base environment
- [ ] Scene 1.1: Nomad encounter & helicopter detection
- [ ] Scene 1.2: Equipment selection & team deployment
- [ ] Scene 1.3-1.5: Infiltration and engagement

### Phase 2: Combat Operations
- Enemy AI and behavior systems
- Combat mechanics and weapons
- Objective system

### Phase 3: Story & Polish
- Narrative progression
- Audio and music
- Visual effects

## Controls

| Input | Action |
|-------|--------|
| W/A/S/D | Move |
| Shift | Sprint |
| Space | Jump |
| Mouse | Look Around |
| ESC | Release Mouse/Pause |

## Installation

1. Clone this repository
2. Open in Godot 4.6.0+
3. Run the project

## License

[Add license information]

## Contributors

- Project Lead: yare-emame-zaman313

---

**Note**: This project is in early development. Assets and features are placeholder/WIP.
