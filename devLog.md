2026-05-14 AM
Pushed: Forklifts only turn when it hits the front. Level select menu takes player to selected level. Player can play next level when they finish a level.
Learned: How to use an array of PackedScenes as levels and navigate to them in the Game Manager.
Next: Level select menu ONLY populates based on the GameManager.Levels array size. After than time to work on a floating moving pallette to cross the acid pits.

2026-05-13 AM
Pushed: Levels 4-6. Bug found where forklift turns if a forklift hits the side of it.
Learned: Getting faster at hotkeys to select and move various scenes in the 2D view.
Next: Add a forward raycast on forklifts that makes it so that the forklift ONLY turns if it collides on the front end.

2026-05-12 AM
Pushed: The first three levels and fixed a bug where the forklifts would move through the finish gate.
Learned: Remembered how to use and create "New Inherited Scene" as different levels.
Next: Create the next 3 levels.

2026-04-19 AM
Pushed: Working pause menu while in game and a level select menu with nonfunctional level buttons
Learned: How signals and inputs are tracked when the game is paused and unpaused
Next: Create the first 6 levels and then add them to the level selection menu

2026-04-18 AM
Pushed: Drop points only accept one package now and walking through an open gate makes the player win! (MVP GAME LOOP COMPELTE)
Learned: A signal thrown to a scene will activate the Signal for ALL nodes in the group if the Signal is connected in the _ready() function
Next: Level selection button in the menu, with seperate level menu to select from

2026-04-17 AM
Pushed: nothing yet
Learned: more work with groups
Next: finish debugging the removal of just ONE node in a group depending on which DropPoint node is closest the the player. Right now it just does the removal until there are no more nodes left in the DropPoint group

2026-04-16 AM
Pushed: Using raycasts to detect whether the player can move, which prevents the 'bouncing' off of walls
Learned: How to disable collision shapes, how to manipulate rayCasts, and organizing RayCasts into Node2Ds
Next: Make it so the player can only drop off packages at EMPTY drop points

2026-04-15 AM
Pushed: Working gate that opens and closes when the player delivers all of the packages
Learned: Remembered how to use the animation player
Next: Need to fix the bug where the player "bounces" off the gate and that the player can drop off multiple packages at the same drop point

2026-04-15 AM
Pushed: The player can now place the package in a goal
Learned: Distinguished between _process and _physics_process and how to add and subtract objects from a "group"
Next: Create an EXIT DOOR that is closed when there are packages in the "pickups" group, but opens when there is none

2026-04-13 AM
Pushed: The package is now carried by the player when picked up
Learned: Originally once the player picked up one package, both packages would get carried by the player, so I learned how to distinguish and manipulate the position of different instantiations of the same scene. 
Next: Place the package in a drop off location

2026-04-12 AM
Pushed: The pickup detects when it's getting picked up
Learned: How to add objects to groups and detect what is colliding with which group
Next: Have the cardboard box actually move with the player once its picked up

2026-04-09 AM
Pushed: Made a cardboard box that will be the objective
Learned: Pickups should be Area2Ds, not Node2Ds
Next: Make the cardboard box able to be picked up and moved by the player

2026-04-08 AM
Pushed: Forklift detects walls and acid now and does a 180 degree turn to keep moving
Learned: How to use the move_and_collide Godot function
Next: Decide what the "objective" of the game is...

2026-04-07 AM
Pushed: Wall tiles and player can't move through new wall tiles
Learned: Needed to add a move timer to prevent clipping through the wall
Next: Forklift can detect walls and acid, then will do a 180 degree turn and keep moving

2026-04-02 AM
Pushed: Forklift hazard is created, forklift kills player and moves in 1 direction
Learned: Remembered how the SignalHub works with hitboxes
Next: Forklift can detect the edge of the map, other hazards, and acid, then will do a 180 degree turn and keep moving.

2026-03-26 AM
Pushed: Created a forklift sprite within Aseprite as the moving hazard
Learned: Some more practice with Aseprite
Next: Code in the hazard and movement for the forklift

2026-03-25 AM
Pushed: Working hazard acid square that ends the game
Learned: Pausing and inheriting processing for different scenes in a scene
Next: Create a horizontally moving hazard

2026-03-23 AM
Pushed: Camera is locked to the tile map +1 tiles worth of border
Learned: To flip back and forth between pixels and tiles with camera and player movement
Next: Create a working hazard square. Player moves into acid and game ends.

2026-03-22 AM
Pushed: Player movement is locked to the size of the tile map and fixed a bug that would teleport the player out of the tile map when you move
Learned: How to move across tile maps instead of using global position values
Next: Camera lock to just where the tiles are.

2026-02-13 AM
Pushed: Camera zoom and player moves across a grid
Learned: How to have a player character move in a grid square
Next: Camera locked to just where the tiles are. Add the "forklift" obstacles

2026-02-12 PM
Pushed: Concrete grid with a custom robot sprite as the Player
Learning: How to draw a grid and create custom grid asset from Aseprite
Next: Make the Player robot be able to travel on the grid.

2026-02-12 AM
Pushed: Created the Godot project and created the main menu that navigates to the empty game scene
Learning: How to use modulo to navigate through a dictionary that uses variables
Next: Create a grid in the game scene (32x32pxl grid squares), then a player that can traverse the grid squares
