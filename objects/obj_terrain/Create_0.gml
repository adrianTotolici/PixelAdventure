/// @description Initialize terrain
grid_cols = (room_width div cell_size) - ui_grid_size;
grid_rows = room_height div cell_size;

terrain_sprites = [spr_t_grass, spr_t_water];
terrain_name = ["Grass", "Water"];

terrain_tiles = array_create(grid_cols);

for (var pos_x = 0; pos_x < grid_cols; pos_x++){
	terrain_tiles[pos_x] = array_create(grid_rows);
	for (var pos_y = 0; pos_y < grid_rows; pos_y++){
		terrain_index = irandom(array_length(terrain_sprites)-1);
		terrain_tiles[pos_x, pos_y] = TerrainStruct(terrain_sprites[terrain_index], terrain_name[terrain_index],"", false, false);
	}
}