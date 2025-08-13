/// @description Initialize terrain
grid_cols = (room_width div cell_size) - ui_x_grid_size;
grid_rows = room_height div cell_size;

var water_proc = 0.3;
win = false;
lose = false;
hunger = false;
build_open = false;

//String Const

//resource in inventory
food = "Food";
materials = "Materials";

// resources on map
wheat = "Wheat";
fish = "Fish";
wood = "Wood";

// terain tiles
grass = "Grass";
water = "Water";

// buildigs && items
raft = "Raft";

terrain_sprites = [spr_t_grass, spr_t_water];
terrain_name = [grass, water];

terrain_tiles = array_create(grid_cols);

for (var pos_x = 0; pos_x < grid_cols; pos_x++){
	terrain_tiles[pos_x] = array_create(grid_rows);
	for (var pos_y = 0; pos_y < grid_rows; pos_y++){
		var rand_terr = random(1);
		if (rand_terr < water_proc) {
			terrain_index = 1;
		}else{
			terrain_index = 0;
		}
		terrain_tiles[pos_x, pos_y] = TerrainStruct(terrain_sprites[terrain_index], terrain_name[terrain_index],"", false, false);
	}
}

pos_x_cave_exit = irandom_range((grid_cols-1)/2, grid_cols-1);
pos_y_cave_exit = irandom_range((grid_rows-1)/2, grid_rows-1);

terrain_tiles[pos_x_cave_exit, pos_y_cave_exit] = TerrainStruct(spr_cave, "Cave Win" ,"", true, true);

pl_health = 100;
pl_thist = 100;
inventory_size = 25;
moveCost = 0.15;
discoverCost = 0.1;
pickCost = 0.05;
hp_loos_huger = 0.5;

inventory = [];
array_push(inventory, ItemStruct(food,20));
array_push(inventory, ItemStruct(materials,20));

recepies = [];
array_push(recepies, BuildRecepiesStruct(raft, materials, 10))