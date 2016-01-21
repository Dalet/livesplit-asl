/*
	v0.6
*/

state("Fallout4", "v1.1.30")
{
	bool isLoadingScreen : 0x6FB1524;
	bool isQuickloading : 0x44BB958;
	bool isCellTransitionLoad : 0x6CC83C8;
	byte isWaiting : 0x704329B;
	/*bool isCrosshairHidden : 0x6FC6B80, 0, 0x150, 0xEC;
	bool isLoadingIconVisible : 0x7033DA8;
	int world : 0x78DAEA0, 0x490, 0x660;
	float x : 0x6F1BC80, 0xd0;
	float y : 0x6F1BC80, 0xd4;
	float z : 0x6F1BC80, 0xd8;*/
}

init
{
	timer.IsGameTimePaused = false;
	game.Exited += (s, e) => timer.IsGameTimePaused = true;

	switch (modules.First().ModuleMemorySize)
	{
		case 132587520:
			version = "v1.1.30";
			break;
	}

	if (string.IsNullOrEmpty(version))
	{
		var ret = System.Windows.Forms.MessageBox.Show(timer.Form,
			"Incompatible game version. (ModuleMemorySize: "+ modules.First().ModuleMemorySize.ToString()+")\n\n"
			+ "This autosplitter is compatible only with v1.1.30.\n"
			+ "Visit speedrun.com/Fallout_4/forum to get this version.\n\n"
			+ "Do you want to open the link?",
			"Fallout 4 Autosplitter", System.Windows.Forms.MessageBoxButtons.YesNo, System.Windows.Forms.MessageBoxIcon.Error);

		if (ret == System.Windows.Forms.DialogResult.Yes)
			System.Diagnostics.Process.Start("http://www.speedrun.com/Fallout_4/thread/fvo80");
	}
}

isLoading
{
	return current.isLoadingScreen || current.isQuickloading || current.isCellTransitionLoad
		|| current.isWaiting == 68;
}
