/// @description Draw UI

// === Panel setup ===
var panel_x = room_width-cell_size*ui_grid_size;
var panel_y = 0;
var panel_w = room_width;
var panel_h = room_height;

draw_set_color(c_dkgray);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
draw_set_alpha(0.6);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);
draw_set_alpha(1);

// === Tile info ===
var player_tile_pos = terrain_tiles[player_pos_x][player_pos_y];
var tile_pos = "Tile: (" + string(player_pos_x) + ", " + string(player_pos_y) + ")";
var terrain_name = player_tile_pos.name;
var tile_msg = player_tile_pos.msg;
var res_info = "Res: "+ string(player_tile_pos.resource.name) + ", " + string(player_tile_pos.resource.quantity);

// === Draw text ===
draw_set_color(c_white);
draw_set_font(fnt_game);
draw_text(panel_x + 8, panel_y + 8, tile_pos);
draw_text(panel_x + 8, panel_y + 28, terrain_name);
draw_text(panel_x + 8, panel_y + 48, tile_msg);
if (player_tile_pos.resource.discoverd && player_tile_pos.resource.available) {
	draw_text(panel_x + 8, panel_y + 68, res_info);
}

