/// @description Draw terrain
// draw player
for (var pos_x = 0; pos_x < grid_cols; pos_x++) {
    for (var pos_y = 0; pos_y < grid_rows; pos_y++) {
		tile = terrain_tiles[pos_x, pos_y];
		var sprite_ind = tile.sprite;
		if (! tile.explored){
			sprite_ind = spr_t_no_explored;
		}
		if (tile.resource.discoverd && tile.resource.available){
			sprite_ind = tile.resource.sprite;
		}
		draw_sprite(sprite_ind, 0, pos_x * cell_size, pos_y * cell_size);
    }
}

var tile_x = player_pos_x * cell_size;
var tile_y = player_pos_y * cell_size;
draw_sprite(spr_player, 0, tile_x, tile_y);
