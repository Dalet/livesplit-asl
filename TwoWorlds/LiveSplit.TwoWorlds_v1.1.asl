state("twoworlds")
{
	bool isLoading : "TwoWorlds.exe", 0x0068A0E4, 0x680, 0x4, 0x41c;
	int cutsceneFrame : "TwoWorlds.exe", 0x6915C8, 0xfc, 0xb8, 0x14, 0x124;
}
 
start
{
	return current.cutsceneFrame == 0 && old.cutsceneFrame != 0;
}
 
split
{
	return current.cutsceneFrame > 0 && old.cutsceneFrame == 0;
}
 
isLoading
{
	return current.isLoading;
}
