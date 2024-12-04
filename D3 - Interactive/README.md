# Deliverable 3 - Interactive Visualiser
## Group 1 - Iona Moynihan, Kumi Gilchrist, Owen Hayes
### LINK TO VIDEO EXPLAINATION: 

#### Iona Moynihan
Had to redo my own model from scratch due to non-manifold geometry present, for Kumi and Owen's models I fixed theirs by uv mapping and making sure there is a single texture file per object.
Began this part of the project by first following the lab examples, this included: first creating a basic render pipeline and a simple shader for a vertice. The next step that followed was to create a JavaScript 'Loader' file that includes two functions; load object, parse object. Loading the object would retrieve the file, parse object carefully reads in the .obj file and splits it into: normals, indices, positions and uvs. This information is later read into the program's buffers to create the renders of the objects.
After creating this script, I had to then begin loading in the parsed data into the position and indices buffers to get the object's geometries to render. After this step was completed, the next step was to add camera movement using key bindings and adding a matrice to place the model's translation as well as creating projection for the camera and model. Once the projection was added, the textures were then later read into the file, with the normals and their positions added soon after. These are all within buffers which are read into the rendering pipeline to produce the final result. Finally, I added lighting as per the lab example, which is used to give light and some surface reflection, shininess, etc. I produced all the HTML code for the rendering process, with Kumi helping to make the .css and Owen writing documentation and both have added extra HTML functionality such as the buttons.

#### Kumi Gilchrist
I began working on the front end for the HTML of this project by designing the user interface, and coding the functionality required. The user interface has components such as buttons for navigating between the models, aswell as descriptions for each model to provide clarification. I assisted in the debugging final stage of the rendering process of the webpages with Iona + Owen.

#### Owen Hayes
Created the documentation for this project including the powerpoint and the video explaination. The HTML was later cleaned up by myself to make the code much more readable, and I helped in the final debugging stages of the rendering process with Iona + Kumi.

### How the models are loaded
The models are loaded in using a Loader.js script which contains two functions: load, parse. The Load function is used to grab the object's file from a filepath, with the parse function splitting the .obj file into 4 variables (by parsing each line and deciding by the first characters of each line what data type it is) which are: normals, uvs, positions, indices.
This javascript is used in the main body of each of the HTML files to retrieve the .obj data and are plugged into the buffers to provide the required geometry data for the models.

### How the scene was built
The object is centered on the screen using the model matrix binding with the camera positioned infront of it. The object slowly spins around the y-axis, with the camera stationary. A light is positioned slightly to the front-right. HTML elements are featured to allow for user navigation and provide more information about the object to the user.

### Shaders and materials used
A simple shader was formed with the help of the previous labs with a focus on the lighting and texturing elements, removing 'color' and focusing on textures.
The fragment shader centers on the lighting variables required to give the surfaces of the objects some 'texture' using diffusion and specularity. The fragment shader also considers the normals, colours, textures, positions and uvs of the object.
The vector shader file has bindings 0-2,6,7 for: model matrix, projection, viewing matrix, normal matrix and the camera position, and the file also contains the color, uvs, normals, fragment positions, view positions and light positions. This shader file takes in each of the vertices, and for each vertice calculates the bindings (as stated above) for it's position, calculates its color, uvs, fragment position (using the model matrix position), the normal position and the viewing position.
As for materials used, this project did not strictly use materials and relied on shaders to do the work.

### User interaction
User interaction comes in the form of navigating to different objects using the arrow buttons on either side of the interface. Additionally, user's may use the arrow keys on the keyboard to pan the camera around the object, as well as using the '+' and '-' to zoom in and out of the object respectively.
