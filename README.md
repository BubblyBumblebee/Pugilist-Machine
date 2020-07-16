# Pugilist Machine
A little project to make fighting games easier to start in Godot Engine. All in GDScript so it's cross-platform.

## MILESTONES
### Playable Build
- ~~Input buffer.~~
- ~~Characters animating.~~
- Collision boxes.
- Move properties.
- Health meter.
- KO screen.
- Start screen.
- 2 player.
- Character Select.
- Button Mapping.

### Netcode Build
- Split simulation and rendering.
- Rollback functions.
 - Save copy of simulation.
 - Check if incoming inputs differ.
 - Overwrite real simulation with copy.
 - Pause render and speed through simulation.
- Input delay to stabilize rollback.
 - Pick input delay.
- Peer to peer connections.
