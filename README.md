# Godot-Skeleton-Bone-Fixer

Godot 3.x creates can create physical bones for skeleton. But godot creates broken bones.

This plugin fixed godot's created bones

## Install

### Manual
Copy [addons](addons) folder from this source to your project

### Using Gorep

Add dependency `Godot-Skeleton-Bone-Fixer:0.0.1`.<br>
Your `gorep_project.json` file should looks like this:

```json
{
  "dependencies": [
    {
      "name": "Godot-Skeleton-Bone-Fixer",
      "version": "0.0.1",
      "type": "INTERNAL"
    }
  ]
}
```

## Using

1. Select your skeleton
2. Create physical bones for skeleton using godot standard tools
3. Select your skeleton and click to "Fix skeleton" on skeleton control button