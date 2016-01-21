/*
	Chaser ASL v0.1
*/

state("chaser")
{
	bool isLoadingScreen : "Chaser.exe", 0x2360DD;
	bool isQuickloading : "Chaser.exe", 0x002301C0, 0x228;
	bool isInCutscene : "Chaser.exe", 0x2335F8;
}

start
{
	return old.isLoadingScreen && !current.isLoadingScreen;
}

isLoading
{
	return current.isLoadingScreen || current.isQuickloading;
}

split
{
	return !old.isQuickloading && current.isQuickloading;
}
