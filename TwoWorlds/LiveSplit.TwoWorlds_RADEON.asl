state("twoworlds_radeon")
{
	bool isLoading : "TwoWorlds_RADEON.exe", 0x00669FC0, 0x680, 0x4, 0x41c;
}

isLoading
{
	return current.isLoading;
}
