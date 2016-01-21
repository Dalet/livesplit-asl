state("fceux")
{
	byte state : 0x2E4518, 0x3c;
	byte time : 0x2E4518, 0x22;
	byte health : 0x2E4518, 0x7e0;
	byte thing : 0x2E4518, 0x76; //bad name but I have no idea what this represents
	byte lastBossHealth : 0x2E4518, 0x687;
}

init
{
	vars.currentLevel = 0;
	vars.reqHealthToContinue = new byte[]
	{
		18,
		15,
		12,
		10,
		10,
		8
	};
}

start
{
	if (current.thing == 128 && old.thing == 1)
	{
		vars.currentLevel = 0;
		return true;
	}
	else
		return false;
}

reset
{
	return current.thing != old.thing && current.thing == 0
		&& current.health == 0 && current.time == 0;
}

split
{
	if (vars.currentLevel < 5)
	{
		if (current.time != old.time && current.time == 0 && current.state == 7
			&& current.health <= vars.reqHealthToContinue[vars.currentLevel])
		{
			vars.currentLevel++;
			return true;
		}
	}
	else
		return current.lastBossHealth != old.lastBossHealth && current.lastBossHealth == 0
			&& current.state == 6 && current.health <= vars.reqHealthToContinue[vars.currentLevel];
}
