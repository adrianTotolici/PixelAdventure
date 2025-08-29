/// @description Draw UI

// === Info Panel setup ===
var panel_x = room_width - cell_size * ui_x_grid_size;
var panel_y = 0;
var panel_w = cell_size * ui_x_grid_size;
var panel_h = 150;

// Fill
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);

// Border
draw_set_alpha(1);
draw_set_color(c_dkgray);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

// --- Tile Info ---
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
        if (player_tile_pos.mob.discovered && player_tile_pos.mob.alive) {
            draw_set_color(c_red);
            draw_text(panel_x + 8, panel_y + (8 + 20 * j), info_text[j]);
            draw_set_color(c_white);
        }
        continue;
    }
    draw_text(panel_x + 8, panel_y + (8 + 20 * j), info_text[j]);
}

// ========= Player Info Panel =========
var panel_pl_x = panel_x;
var panel_pl_y = panel_y + panel_h;
var panel_pl_w = panel_w;
var panel_pl_h = 100;

// Fill
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(panel_pl_x, panel_pl_y, panel_pl_x + panel_pl_w, panel_pl_y + panel_pl_h, true);

// Border
draw_set_alpha(1);
draw_set_color(c_dkgray);
draw_rectangle(panel_pl_x, panel_pl_y, panel_pl_x + panel_pl_w, panel_pl_y + panel_pl_h, false);

// --- Player Info ---
var line_height = 20;
var text_x = panel_pl_x + 8;
var text_y = panel_pl_y + 8;

draw_set_color(c_white);
draw_set_font(fnt_game);

var pl_text = [
    "HP: " + string(pl_health),
    "ATK: " + string(pl_atk)
];
var current_line = 0;

for (var k = 0; k < array_length(pl_text); k++) {
    draw_text(text_x, text_y + current_line * line_height, pl_text[k]);
    current_line++;
}

var inv_array = parseInventory(inventory);
for (var q = 0; q < array_length(inv_array); q++) {
    draw_text(text_x, text_y + current_line * line_height, inv_array[q]);
    current_line++;
}

draw_text(text_x, text_y + current_line * line_height, "---------------");

// ========== Mob Info Panel ==========
var panel_mob_x = panel_pl_x;
var panel_mob_y = panel_pl_y + panel_pl_h;
var panel_mob_w = panel_pl_w;
var panel_mob_h = 100;

// Fill
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(panel_mob_x, panel_mob_y, panel_mob_x + panel_mob_w, panel_mob_y + panel_mob_h, true);

// Border
draw_set_alpha(1);
draw_set_color(c_dkgray);
draw_rectangle(panel_mob_x, panel_mob_y, panel_mob_x + panel_mob_w, panel_mob_y + panel_mob_h, false);

// --- Mob Info ---
var mob_text_x = panel_mob_x + 8;
var mob_text_y = panel_mob_y + 8;

draw_set_color(c_white);
if (current_mob_name != noone) {
    var mob_text = [
        "Name: " + current_mob_name,
        "HP: " + string(current_mob_hp),
        "ATK: " + string(current_mob_atk),
		"-------------------"
    ];

    for (var m = 0; m < array_length(mob_text); m++) {
        draw_text(mob_text_x, mob_text_y + m * line_height, mob_text[m]);
    }
}

// ========== Command Panel ==========
var panel_com_x = panel_x;
var panel_com_y = panel_mob_y + panel_mob_h;
var panel_com_w = panel_w;
var panel_com_h = max(1, room_height - (panel_h + panel_pl_h + panel_mob_h));

// Fill
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(panel_com_x, panel_com_y, panel_com_x + panel_com_w, panel_com_y + panel_com_h, true);

// Border
draw_set_alpha(1);
draw_set_color(c_dkgray);
draw_rectangle(panel_com_x, panel_com_y, panel_com_x + panel_com_w, panel_com_y + panel_com_h, false);

// --- Commands ---
var command_text = [
    "SPACE - discover",
    "g - grid",
    "p - pick resource",
    "b - build",
    "a - attack",
    "ESC - return to main menu"
];

var build_items = [
	{ name: "b - close build menu", spr: spr_inv_res },
    { name: "r - raft (10 mat)", spr: spr_wooden_raft },
    { name: "c - wood club (3 mat)", spr: spr_wooden_club }
];

if (build_open) {
    for (var q = 0; q < array_length(build_items); q++) {
        var item = build_items[q];

        var row_y = panel_com_y + 12 + (q * 32); // spacing per row

        // Draw sprite
        if (item.spr != noone) {
            draw_sprite(item.spr, 0, panel_com_x + 8, row_y-10);
        }

        // Font + color
        draw_set_font(fnt_game);
        draw_set_color(c_white);

        // Text aligned with sprite
        draw_text(panel_com_x + 40, row_y - 4, item.name);
    }
}
else {
    // ✅ draw the normal command list when build menu is closed
    draw_set_font(fnt_game);
    draw_set_color(c_white);

    for (var c = 0; c < array_length(command_text); c++) {
        draw_text(panel_com_x + 8, panel_com_y + 12 + (c * 20), command_text[c]);
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

// ======== Game Lose Message ========
if (lose) {
    var game_lose_1 = "You Lose !!!";
    var game_lose   = "You have died of hunger.";
    var game_lose_2 = "Press ESC to return.";

    draw_set_font(fnt_game_won);
    draw_set_color(c_black);
    draw_text(room_width / 2 - 270, room_height / 2,     game_lose_1);
    draw_text(room_width / 2 - 350, room_height / 2 +20, game_lose);
    draw_text(room_width / 2 - 320, room_height / 2 +40, game_lose_2);
}
