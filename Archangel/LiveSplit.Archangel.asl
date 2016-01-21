/*
	Archangel ASL v0.2
*/

state("game")
{
	/*
		2 == Saving
		3 == Loading
		4 == Finishing
		5 == Initial loading screen at launch
	*/
	int screen : "game.exe", 0x0008E254, 0x0;
}
 
isLoading
{
	return current.screen >= 2 && current.screen <= 5;
}