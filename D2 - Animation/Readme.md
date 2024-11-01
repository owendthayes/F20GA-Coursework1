DELIVERABLE 2 - Unreal Engine Animation
---
BY: Group 1 (Iona Moynihan, Kumi Gilchrist, Owen Hayes)

--------------------------
Iona Moynihan
-
> Took apart the background for the Render and exported each of the objects in FBX form for Unreal Engine.
> Rigged snake to give it a skeleton in Blender, this allows skeletal animation during the animating progress using Sequencer. SEE BELOW FOR 'RIGGING PROCESS'.
> Imported her object into Unreal as a FBX model.
> Fixed the materials, particularly the plants within the vivarium, which required materials to be double sided and have an opacity mask.
> Placed the vivarium together within the project- had to use the Skeletal Mesh for Shoelace the snake (in order to do animation).
> Created a new Sequencer to allow for the animation process.
> ANIMATING SHOELACE THE SNAKE USING SEQUENCER(concepts learnt in class for animation): had to use Timing to get the snake in the correct orientation at the right time- did so by manipulating it's transform. Used Pose-To-Pose animation- with each keyframe manipulating between different poses a bone can do.

Kumi Gilchrist
-
> Set up the Unreal Project and manually hand-placed and imported the background for our animation.
> Fixed any background object materials issues.
> TBC!!!!!

Owen Hayes
-
> Rigged guitar strings in Blender for same reasons as Iona above, in particularly, rigged the lower string segments to allow for animation. SEE BELOW FOR 'RIGGING PROCESS'.
> Imported the guitar in FBX form into the project, had to fix it's material as it's face normals were facing the wrong way- inverted them in Blender before re-importing.
> Set up a Camera for Unreal Engine.
> TBC!!!!!


RIGGING PROCESS:
1. created an Armature in Blender
2. created the bone layout in the Armature INCLUDING Root bone for correct import into Unreal Engine.
3. parented the mesh to the armature, make armature the parent with option 'parent with empty weights'.
4. manually weight painted the areas of the mesh per vertex group (bone).
5. exported the rigged model.