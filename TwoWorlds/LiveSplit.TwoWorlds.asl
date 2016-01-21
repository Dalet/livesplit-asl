state("twoworlds")
{
	bool isLoading : "TwoWorlds.exe", 0x006B4460, 0x680, 0x4, 0x41c;
	bool isLoading_win8 : "TwoWorlds.exe", 0x006B4594, 0xB48, 0x18, 0xA9C;
}

isLoading
{
	if (Environment.OSVersion.Version < new Version(6, 2))
		return current.isLoading;
	else
		return current.isLoading_win8;
}
