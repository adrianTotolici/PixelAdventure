// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkMobAttack(tile, pl_hp){
	var mob = tile.mob;
	if (mob != noone && mob.alive && mob.discovered){
		return attack(mob.atk, pl_hp);
	}
	return pl_hp;
}