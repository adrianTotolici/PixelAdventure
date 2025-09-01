/// @description Initialize terrain

grid_cols = (room_width div cell_size) - ui_x_grid_size;
grid_rows = room_height div cell_size;

// 0 - 0.3 water | 0.31 - 0.5 -mud | rest grass
var water_proc = 0.3;
var mud_proc = 0.5;
win = false;
lose = false;
hunger = false;
build_open = false;

//String Const

//resource in inventory
food = "Food";
materials = "Materials";
weapon = "weapon";

// resources on map
wheat = "Wheat";
fish = "Fish";
wood = "Wood";
rock = "Rock";
mushrooms = "Mushrooms";

// terain tiles
grass = "Grass";
water = "Water";
mud = "Mud";

// buildigs && items
raft = "Raft";
woden_club ="Wooden Club";

// dmg list
no_dmg = 0;
wooden_club_dmg = 5;

// mobs
snake = "Snake";
wolf = "Wolf";
shark = "Shark";

terrain_sprites = [spr_t_grass, spr_t_water, spr_t_mud];
terrain_name = [grass, water, mud];

terrain_tiles = array_create(grid_cols);

for (var pos_x = 0; pos_x < grid_cols; pos_x++){
	terrain_tiles[pos_x] = array_create(grid_rows);
	for (var pos_y = 0; pos_y < grid_rows; pos_y++){
		var rand_terr = random(1);
		if (rand_terr < water_proc) {
			terrain_index = 1;
		}else if (rand_terr < mud_proc){
			terrain_index = 2;
		}else{
			terrain_index = 0;
		}
		terrain_tiles[pos_x, pos_y] = TerrainStruct(terrain_sprites[terrain_index], terrain_name[terrain_index],"", false, false);
	}
}

pos_x_cave_exit = irandom_range((grid_cols-1)/2, grid_cols-1);
pos_y_cave_exit = irandom_range((grid_rows-1)/2, grid_rows-1);

terrain_tiles[pos_x_cave_exit, pos_y_cave_exit] = TerrainStruct(spr_cave, "Cave Win" ,"", false, true);

pl_health = 300;
pl_thist = 50;
inventory_size = 25;
moveCost = 0.15;
discoverCost = 0.1;
pickCost = 0.05;
hp_loos_huger = 0.5;
pl_atk = 1;

inventory = [];
array_push(inventory, ItemStruct(food,35, food));
array_push(inventory, ItemStruct(materials,0, materials));

recepies = [];
array_push(recepies, BuildRecepiesStruct(raft, materials, 10));
array_push(recepies, BuildRecepiesStruct(woden_club, materials, 3));

current_mob_hp = 0;
current_mob_name = noone;
current_mob_atk = 0;