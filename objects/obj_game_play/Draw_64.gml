/// @description Draw UI

// === Panel setup ===
var panel_x = room_width-cell_size*ui_x_grid_size;
var panel_y = 0+cell_size*2;
var panel_w = room_width;
var panel_h = room_height-cell_size*ui_y_grid_size;

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
	draw_set_color(c_yellow);
	draw_text(panel_x + 8, panel_y + 68, res_info);
}

// ========== Comand Panel =====
var panel_com_x = panel_x;
var panel_com_y = panel_h;
var panel_com_w = panel_w;
var panel_com_h = room_height;

draw_set_color(c_dkgray);
draw_rectangle(panel_com_x, panel_com_y, panel_com_x + panel_com_w, panel_com_h + panel_com_h, false);
draw_set_alpha(0.6);
draw_rectangle(panel_com_x, panel_com_y, panel_com_x + panel_com_w, panel_com_h + panel_com_h, true);
draw_set_alpha(1);

// commands
var discover_comm = "SPACE - discover";
var grid_comm = "g - grid";
var return_comm = "ESC - return to main menu";

//draw text
// === Draw text ===
draw_set_color(c_white);
draw_set_font(fnt_game);
draw_text(panel_com_x + 8, panel_com_y + 8, discover_comm);
draw_text(panel_com_x + 8, panel_com_y + 28, grid_comm);
draw_text(panel_com_x + 8, panel_com_y + 48, return_comm);

if (win) {
	var game_won = "You have found the cave.";
	var game_won_2 ="Press ESC to return. ";
	var game_won_1 ="You Won !!!";
	draw_set_font(fnt_game_won);
	draw_set_color(c_black);
	draw_text(room_width/2 - 270, room_height/2, game_won_1);
	draw_text(room_width/2 - 350, room_height/2+20, game_won);
	draw_text(room_width/2 - 320, room_height/2+40, game_won_2);
}

//========= Player Info pannel =================
