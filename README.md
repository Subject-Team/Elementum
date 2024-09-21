# Elementum
 Powerful library manager for Godot

## How To Use?
### Step1: Install & Optimize Elementum Plugin
1. **Get Plugin**: Download and install elementum plugin from [releases](https://github.com/Subject-Team/Elementum/releases).
2. **Import Plugin**: Open your project, go to `AssetLib`, click on `Import...` and import `Elementum-Plugin.zip` file.
3. **Activate Plugin**: Go to `Project > Project Settings > Plugins` and set `Elementum` status to `enable`.
4. **Remove Plugin Zip**: Now you can remove `Elementum-Plugin.zip`.
### Step2: Install Libraries
1. **Download Libraries**: See [this page](https://github.com/Subject-Team/Elementum/wiki/Libraries) for browse Elementum libraries, you can click on libraries to see repository. in library ripository you can download library from releases.
2. **Import Libraries**: Open your project, go to `AssetLib`, click on `Import...` and import library `.zip` file.
3. **Reload Project**: Use `Project>Reload Current Project`.
### Finish
Now you can use libraries, for guides you should see library repository.

## How Create Library?
1. **Create ripository**: Create a godot project and add project to github.
2. **Create Library**: Create script in `addons/Elementum/Libraries/` folder with this themplate (don't froget [GDScript Style Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)!):
   ```
   class_name %your_library_name%_Elementum
   extends Elementum

   func exampel(test_parameter):
     print("It's only for test!")
   
   ...
   ```
3. **Write Docs**: See [here](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html) for documentation in Godot.
4. **Create A Release**: Create a `.zip` file from `addons` folder (You should have only that: `addons/Elemntum/Libraries/%LibraryName%.gd`) and upload it as release.
5. **Publish Library**: Add your repository to [Elementum libraries page](https://github.com/Subject-Team/Elementum/wiki/Libraries)
