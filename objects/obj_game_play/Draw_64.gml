/// @description Draw UI

// === Info Panel setup ===
var panel_x = room_width - cell_size * ui_x_grid_size;
var panel_y = 0;
var panel_w = cell_size * ui_x_grid_size; // sidebar width
var panel_h = 150; // info panel height

draw_set_color(c_dkgray);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
draw_set_alpha(0.6);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);
draw_set_alpha(1);

//Tile info 
var player_tile_pos = terrain_tiles[player_pos_x][player_pos_y];
var info_text = [
    "Tile: (" + string(player_pos_x) + ", " + string(player_pos_y) + ")",
    player_tile_pos.name,
    player_tile_pos.msg,
    "Res: " + string(player_tile_pos.resource.name) + ", " + string(player_tile_pos.resource.quantity),
	"Mob: " + player_tile_pos.mob.name,
    "----------------------"
];

draw_set_color(c_white);
draw_set_font(fnt_game);

for (var j = 0; j < array_length(info_text); j++) {
    if (j == 3) {
        if (player_tile_pos.resource.discoverd && player_tile_pos.resource.available) {
            draw_set_color(c_yellow);
            draw_text(panel_x + 8, panel_y + (8 + 20 * j), info_text[j]);
            draw_set_color(c_white);
        }
        continue;
    }
	if (j == 4) {
		if (player_tile_pos.mob.discovered && player_tile_pos.mob.alive){
			draw_set_color(c_red);
			draw_text(panel_x + 8, panel_y + (8 + 20 * j), info_text[j]);
			draw_set_color(c_white);
		}
		continue;
	}
    draw_text(panel_x + 8, panel_y + (8 + 20 * j), info_text[j]);
}

// ========= Player Info Panel (middle) =========

// Panel dimensions
var panel_pl_x = panel_x;
var panel_pl_y = panel_y + panel_h; // Below main info panel
var panel_pl_w = panel_w;
var panel_pl_h = 100;

// Background with border
draw_set_alpha(0.6);
draw_set_color(c_dkgray);
draw_rectangle(panel_pl_x, panel_pl_y, panel_pl_x + panel_pl_w, panel_pl_y + panel_pl_h, false);
draw_rectangle(panel_pl_x, panel_pl_y, panel_pl_x + panel_pl_w, panel_pl_y + panel_pl_h, true);
draw_set_alpha(1);

// ===== Player Info =====
var line_height = 20;
var text_x = panel_pl_x + 8;
var text_y = panel_pl_y + 8;

draw_set_color(c_white);
draw_set_font(fnt_game);

// Player stats
var pl_text = [
    "HP: " + string(pl_health)
];
var current_line = 0;

for (var k = 0; k < array_length(pl_text); k++) {
    draw_text(text_x, text_y + current_line * line_height, pl_text[k]);
    current_line++;
}

// Inventory
var inv_array = parseInventory(inventory);
for (var q = 0; q < array_length(inv_array); q++) {
    draw_text(text_x, text_y + current_line * line_height, inv_array[q]);
    current_line++;
}

// End panel marker
draw_text(text_x, text_y + current_line * line_height, "---------------");

// ========== Mob Info Panel (NEW) ==========
var panel_mob_x = panel_pl_x;
var panel_mob_y = panel_pl_y + panel_pl_h; // Below player panel
var panel_mob_w = panel_pl_w;
var panel_mob_h = 100; // can adjust depending on how much info you want

// Background
draw_set_alpha(0.6);
draw_set_color(c_dkgray);
draw_rectangle(panel_mob_x, panel_mob_y, panel_mob_x + panel_mob_w, panel_mob_y + panel_mob_h, false);
draw_rectangle(panel_mob_x, panel_mob_y, panel_mob_x + panel_mob_w, panel_mob_y + panel_mob_h, true);
draw_set_alpha(1);

// Mob info text
var mob_text_x = panel_mob_x + 8;
var mob_text_y = panel_mob_y + 8;

if (current_mob_name != noone){
	var mob_text = [
		"Name: " + current_mob_name,
	    "HP: " + string(current_mob_hp),
		"ATK: " + string(current_mob_atk)
	];

	// Draw mob info

	for (var m = 0; m < array_length(mob_text); m++) {
	    draw_text(mob_text_x, mob_text_y + m * line_height, mob_text[m]);
	}
}


// ========== Command Panel (bottom) ==========
var panel_com_x = panel_x;
var panel_com_y = panel_mob_y + panel_mob_h; // right after player panel
var panel_com_w = panel_w;
var panel_com_h = max(1, room_height - (panel_h + panel_pl_h + panel_mob_h)); // fill remaining space

draw_set_color(c_dkgray);
draw_rectangle(panel_com_x, panel_com_y, panel_com_x + panel_com_w, panel_com_y + panel_com_h, false);
draw_set_alpha(0.6);
draw_rectangle(panel_com_x, panel_com_y, panel_com_x + panel_com_w, panel_com_y + panel_com_h, true);
draw_set_alpha(1);

// commands
var command_text = [
    "SPACE - discover",
    "g - grid",
	"p - pick resource",
	"b - build",
	"a - attack",
    "ESC - return to main menu"
];

var build_command = [
	"b - close build menu",
	"r - raft (10 materials)"
];

draw_set_color(c_white);
draw_set_font(fnt_game);
if (build_open){
	for (var q = 0; q < array_length(build_command); q++){
		draw_text(panel_com_x + 8, panel_com_y +8 + (q*20), build_command[q]);
	}
}else{
	for (var k = 0; k < array_length(command_text); k++) {
	  draw_text(panel_com_x + 8, panel_com_y + 8 + (k * 20), command_text[k]);
	}
}

// ======== Game Win Message ========
if (win) {
    var game_won_1 = "You Won !!!";
    var game_won   = "You have found the cave.";
    var game_won_2 = "Press ESC to return.";

    draw_set_font(fnt_game_won);
    draw_set_color(c_black);
    draw_text(room_width / 2 - 270, room_height / 2,     game_won_1);
    draw_text(room_width / 2 - 350, room_height / 2 +20, game_won);
    draw_text(room_width / 2 - 320, room_height / 2 +40, game_won_2);
}

// ======== Game lose Message ========
if (lose) {
    var game_lose_1 = "You Lose !!!";
    var game_lose  = "You have died of hunger.";
    var game_lose_2 = "Press ESC to return.";

    draw_set_font(fnt_game_won);
    draw_set_color(c_black);
    draw_text(room_width / 2 - 270, room_height / 2,     game_lose_1);
    draw_text(room_width / 2 - 350, room_height / 2 +20, game_lose);
    draw_text(room_width / 2 - 320, room_height / 2 +40, game_lose_2);
}