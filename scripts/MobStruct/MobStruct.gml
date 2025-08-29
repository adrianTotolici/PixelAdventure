function MobStruct(_sprite, _name, _hp, _atk, _spd, _discovered){
	return {
		sprite: _sprite,
		name: _name,
		hp: _hp,
		atk: _atk,
		spd: _spd,
		alive: modAlive(_hp),
		discovered: _discovered
	};
}

function modAlive(hp){
	if (hp <=0 ){
		return false;
	}else{
		return true;
	}
}