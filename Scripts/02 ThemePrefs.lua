local function OptionNameString(str)
	return THEME:GetString('OptionNames',str)
end

local Prefs =
{
	BOOT =
	{
		Default = false,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	GENRESCR =
	{
		Default = false,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	ALTMUSCR =
	{
		Default = false,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
}

ThemePrefs.InitAll(Prefs)

function OptionRowDummySound()
	return {
		Name="DummySound",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = { 'STEREO', 'MONO', },
		LoadSelections = function(self, list, pn)
			list[1] = true
		end,
		SaveSelections = function(self, list, pn)
		end,
	}
end

function OptionRowDummyAttractSnd()
	return {
		Name="DummyAttractSnd",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = true,
		ExportOnChange = false,
		Choices = { 'ALL THE TIME', 'NEVER', },
		LoadSelections = function(self, list, pn)
			list[1] = true
		end,
		SaveSelections = function(self, list, pn)
		end,
	}
end