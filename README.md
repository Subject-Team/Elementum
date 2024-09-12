# Elementum
 Powerful library manager for Godot

## How To Use?
### Step1: Install & Optimize Elementum Plugin
1. **Get Plugin**: Download and install elementum plugin from [releases](https://github.com/Subject-Team/Elementum/releases).
2. **Import Plugin**: Open your project, go to `AssetLib`, click on `Import...` and import `Elementum-Plugin.zip` file.
3. **Activate Plugin**: Go to `Project > Project Settings > Plugins` and set `Elementum` status to `enable`.
4. **Remove Plugin Zip**: Now you can remove `Elementum-Plugin.zip`.
5. **AutoLoad Setup**: Go to `Project Settings > Auto Load`, and add `res://addons/Elementum/ElementumClass.gd` with the name `ElementumClass` in project autoload.
### Step2: Install Libraries
1. **Download Libraries**: See [this page](https://github.com/Subject-Team/Elementum/wiki/Libraries) for browse Elementum libraries, you can click on libraries to see repository. in library ripository you can download library from releases.
2. **Create Libraries Folder**: Go to the main folder of your project and create a "Elementum" folder.
3. **Create Folder For Each Library** (recommended): In "Elementum" folder create new folders for each libraries, this will make your project more organized.
4. **Install Libraries**: Save libraries in folders.
5. **Introduce libraries**: Open `res://addons/Elementum/libraries.txt` and create a dictionary of your libraries like this:
   ```
   {
   "FileManger" : "res://Elementum/FileManger/FileManger.gd",
   "ArrayTools" : "res://Elementum/ArrayTools/ArrayTools.gd",
   }
   ```
   After write dictionary and save it, you need reload your project using `Project > Reload Current Project`
### Finish
Now you can use libraries, for guides you should see library repository.

## How Create Library?
1. **Create ripository**: Create a godot project and add project to github.
2. **Create Library**: You should use this themplate (don't froget [GDScript Style Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)!):
   ```
   class_name %your_library_name%
   extends Elementum

   func exampel(test_parameter):
     print("It's only for test!")
   
   ...
   ```
3. **Write Docs**: See [here](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html) for documentation in Godot.
4. **Publish Library**: Add your repository to [Elementum libraries page](https://github.com/Subject-Team/Elementum/wiki/Libraries)
