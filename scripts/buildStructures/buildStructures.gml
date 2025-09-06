// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buildStructures(tile,building_sprite, name){
	tile.building = BuildingStruct(name);
	tile.building_spr = building_sprite;
}