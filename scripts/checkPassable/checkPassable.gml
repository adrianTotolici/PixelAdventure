// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkPassable(tile_check) {
    if (tile_check.name == water && !checkInventoryQuantity(inventory, raft, 1)) {
        return false; // can't pass water without raft
    }
    return true; // all other cases passable
}