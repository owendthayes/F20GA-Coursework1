class Loader {
    //class to load our object

    //get file contents function
    //THIS WORKS
    async load(filepath) {
        console.log("loading object in Loader.js: START");
        //fetch the file
        const response = await fetch (filepath);
        console.log("poop");
        //if cannot load file
        if(!response.ok)
        {
            throw new Error('object loader could not find file located at ${filepath}. check your path.');
        }
        const file = await response.text();
        if (file.length === 0) {
            throw new Error('${filepath} file is empty');
        }

        //debugging
        console.log("loading object in Loader.js: SUCCESS");
        console.log("response: " + file);

        return file;
    }

    //mesh parser function
    parse(file) {
        //make sure input is a string
        if (typeof file !== "string") {
            throw new TypeError("Expected a string input for parsing");
        }
        const lines = file.split("\n"); //split the file line-by-line
        //show some parsing content for debugging
        console.log("Parsing content: ", lines.slice(0, 10));

        //variables to store the contents of the file
        const cachedPositions = [];
        const cachedFaces = [];
        const cachedNormals = [];
        const cachedUvs = [];

        //store data from the file into the above variables
        for (const untrimmedLine of lines)
        {
            //remove any whitespace
            const line = untrimmedLine.trim();
            //console.log(line);

            //split line into the first character and the chars after
            const [sChar, ...data] = line.split(" ");

            //depending on the starting character, push onto either variable from above
            switch(sChar)
            {
                case "v":
                    cachedPositions.push(data.map(parseFloat));
                    break;
                case "vt":
                    cachedUvs.push(data.map(parseFloat));
                    break;
                case "vn":
                    cachedNormals.push(data.map(parseFloat));
                    break;
                case "f":
                    cachedFaces.push(data);
                    break;
            }
            //debug show parsed positions
            console.log("Parsed positions:", cachedPositions);
            //debug show parsed faces
            console.log("Parsed faces:", cachedFaces);

            //intermediate arrays to finalise the object parsing
            var finalVertices = [];
            var finalNormals = [];
            var finalUvs = [];
            var finalIndices = []; //changed from const to vars

            //loop through faces
            const cache = {};
            let i = 0;

            //for each face
            for (const faces of cachedFaces)
            {
                //for each vertice of face
                for (const faceString of faces)
                {
                    //if the vertice is defined
                    if(cache[faceString] != undefined)
                    {
                        //add to indices
                        finalIndices.push(cache[faceString]);
                        //continue
                        continue;
                    }

                    //set indice for the vertex and push onto the final indices
                    cache[faceString] = i;
                    finalIndices.push(i);

                    //convert the strings into integers and sub by 1 to get zero index
                    const [vI, uvI, nI] = faceString.split("/").map((s) => Number(s) - 1);
                    vI > -1 && finalVertices.push(...cachedPositions[vI]);
                    uvI > -1 && finalUvs.push(...cachedUvs[uvI]);
                    nI > -1 && finalNormals.push(...cachedNormals[nI]);

                    //debug show parsed positions
                    console.log("cached positions:", finalVertices);

                    i += 1;
                }
            }
        }
        //now return the obj's parsed data as 32 float arrays, with the indice being a 16 int array into buffers
        return {
            positions: new Float32Array(finalVertices),
            uvs: new Float32Array(finalUvs),
            normals: new Float32Array(finalNormals),
            indices: new Uint16Array(finalIndices), //index buffer prevents the duplication of data
        };
        
    }
}
//export class
export default Loader;