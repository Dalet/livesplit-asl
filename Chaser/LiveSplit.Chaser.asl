/*
	Chaser ASL v0.1
*/

state("chaser")
{
	bool isLoadingScreen : "Chaser.exe", 0x2360DD;
	bool isQuickloading : "Chaser.exe", 0x002301C0, 0x228;
}

isLoading
{
	return current.isLoadingScreen || current.isQuickloading;
}
