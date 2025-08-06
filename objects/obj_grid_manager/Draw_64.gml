// === Panel setup ===
var panel_x = 10;
var panel_y = 10;
var panel_w = 300;
var panel_h = 70;

draw_set_color(c_dkgray);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
draw_set_alpha(0.6);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);
draw_set_alpha(1);

// === Tile info ===
var tile_pos = "Tile: (" + string(cursor_x) + ", " + string(cursor_y) + ")";
var terrain_index = grid_data[cursor_x][cursor_y];
var terrain_type = tile_sprites[terrain_index];

// === Draw text ===
draw_set_color(c_white);
draw_set_font(fnt_game);
draw_text(panel_x + 8, panel_y + 8, tile_pos);
draw_text(panel_x + 8, panel_y + 28, terrain_type);
draw_text(panel_x + 8, panel_y + 48, tile_msg);
