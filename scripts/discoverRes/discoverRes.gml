// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function discoverRes(tile_data,pos_x, pos_y){
	tile_data[pos_x, pos_y].resource.discoverd = true;
	tile_data[pos_x, pos_y].mob.discovered = true;
}