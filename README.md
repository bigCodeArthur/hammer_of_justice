```

res://
├── audio/
│   ├── music/
│   └── effects/
├── config/
│   ├── player_preferences.tres (on release will be stored at appdata)
│   └── player_preferences.gd
├── entities/
│   ├── {entity type name} (ex: character)/
│   │   ├── {entity type name}_base.gd
│   │   └── {entity name} (ex: enemy/player)/
│   │       ├── ?resources/
│   │       ├── textures/
│   │       ├── {entity_name}.gd
│   │       ├── {entity_name}.gltf
│   │       └── {entity_name}.tscn
│   └── {entity name} (ex: tree)/
│       ├── ?resources/
│       ├── textures/
│       ├── {entity_name}.gd
│       ├── {entity_name}.gltf
│       └── {entity_name}.tscn
├── levels/
│   ├── common_models/
│   │   └── {model_name}.gltf
│   └── {level name}/
│       ├── models/
│       │   └── {model_name}.gltf
│       └── {level_name}.tscn
├── ui/
│   ├── textures/
│   ├── scripts/
│   └── scenes/
└── helpers/
	└── {helper_name}.gd

```
