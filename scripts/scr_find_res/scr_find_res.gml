// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_find_res(index, nr_tiles){
	switch (index) {
		case 3:
			obj_grid_manager.grid_data[cursor_x, cursor_y] = obj_grid_manager.tile_sprites[nr_tiles-index+1];
			break;
		default:
	}
}