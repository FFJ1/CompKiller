--[[
		Example Compkiller UI
	
	Author: 4lpaca
	
	Press Left Alt to open / close
]]

local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))();

-- Create Config Mamager --
local ConfigManager = Compkiller:ConfigManager({
	Directory = "Compkiller-UI",
	Config = "Example-Configs"
});

-- Loading UI (Icon <string> , Duration <number>) --
Compkiller:Loader("rbxassetid://120245531583106" , 2.5).yield();

-- Creating Window --
local Window = Compkiller.new({
	Name = "COMPKILLER",
	Keybind = "LeftAlt",
	Logo = "rbxassetid://120245531583106",
	Scale = Compkiller.Scale.Window, -- Leave blank if you want automatic scale [PC, Mobile].
	TextSize = 15,
});

-- Watermark --
local Watermark = Window:Watermark();

Watermark:AddText({
	Icon = "user",
	Text = "4lpaca",
});

Watermark:AddText({
	Icon = "clock",
	Text = Compkiller:GetDate(),
});

local Time = Watermark:AddText({
	Icon = "timer",
	Text = "TIME",
});

task.spawn(function()
	while true do task.wait()
		Time:SetText(Compkiller:GetTimeNow());
	end
end)

Watermark:AddText({
	Icon = "server",
	Text = Compkiller.Version,
});

-- Creating Tab Category --
Window:DrawCategory({
	Name = "Example"
});

-- Creating Tab --
local NormalTab = Window:DrawTab({
	Name = "Example Tab",
	Icon = "apple",
});

-- Creating Section --
local NormalSection = NormalTab:DrawSection({
	Name = "Section",
	Position = 'left'	
});

local Toggle = NormalSection:AddToggle({
	Name = "Toggle",
	Flag = "Toggle_Example", -- Leave it blank will not save to config
	Default = false,
	Callback = print,
});

-- Add Keybind To Toggle --
local Keybind = Toggle.Link:AddKeybind({
	Default = "E",
	Flag = "Option_Keybind",
	Callback = print
});

-- Helper --

Toggle.Link:AddHelper({
	Text = "Very cool toggle!"
})

-- Add Option To Toggle --
local Toggle2 = NormalSection:AddToggle({
	Name = "Toggle",
	Flag = "Toggle_Example2", -- Leave it blank will not save to config
	Default = false,
	Callback = print,
});

local Option = Toggle2.Link:AddOption()

Option:AddToggle({
	Name= "Example",
	Flag = "Toggle_Example3",
	Callback = print
});

NormalSection:AddKeybind({
	Name = "Keybind",
	Default = "LeftAlt",
	Flag = "Keybind_Example",
	Callback = print,
});

NormalSection:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 100,
	Default = 50,
	Round = 0,
	Flag = "Slider_Example",
	Callback = print
});

NormalSection:AddColorPicker({
	Name = "ColorPicker",
	Default = Color3.fromRGB(0, 255, 140),
	Flag = "Color_Picker_Example",
	Callback = print
})

NormalSection:AddDropdown({
	Name = "Single Dropdown",
	Default = "Head",
	Flag = "Single_Dropdown",
	Values = {"Head","Body","Arms","Legs"},
	Callback = print
})

NormalSection:AddDropdown({
	Name = "Multi Dropdown",
	Default = {"Head"},
	Multi = true,
	Flag = "Multi_Dropdown",
	Values = {"Head","Body","Arms","Legs"},
	Callback = print
})

NormalSection:AddButton({
	Name = "Button",
	Callback = function()
		print('PRINT!')
	end,
})

NormalSection:AddParagraph({
	Title = "Paragraph",
	Content = "Very cool paragraph\nAll element in this scrtion\nwill be saved to the config!"
})

local DrawElements = function(Tab,Position)
	do
		local NormalSectionRight = Tab:DrawSection({
			Name = "Section",
			Position = Position
		});

		local Toggle = NormalSectionRight:AddToggle({
			Name = "Toggle",
			Default = false,
			Callback = print,
		});

		-- Add Keybind To Toggle --
		local Keybind = Toggle.Link:AddKeybind({
			Default = "E",
			Callback = print
		});

		-- Add Option To Toggle --
		local Toggle2 = NormalSectionRight:AddToggle({
			Name = "Toggle",
			Default = false,
			Callback = print,
		});

		local Option = Toggle2.Link:AddOption()

		Option:AddToggle({
			Name= "Example",
			Callback = print
		});

		NormalSectionRight:AddKeybind({
			Name = "Keybind",
			Default = "LeftAlt",
			Callback = print,
		});

		NormalSectionRight:AddSlider({
			Name = "Slider",
			Min = 0,
			Max = 100,
			Default = 50,
			Round = 0,
			Callback = print
		});

		NormalSectionRight:AddColorPicker({
			Name = "ColorPicker",
			Default = Color3.fromRGB(0, 255, 140),
			Callback = print
		})

		NormalSectionRight:AddDropdown({
			Name = "Single Dropdown",
			Default = "Head",
			Values = {"Head","Body","Arms","Legs"},
			Callback = print
		})

		NormalSectionRight:AddDropdown({
			Name = "Multi Dropdown",
			Default = {"Head"},
			Multi = true,
			Values = {"Head","Body","Arms","Legs"},
			Callback = print
		})

		NormalSectionRight:AddButton({
			Name = "Button",
			Callback = function()
				print('PRINT!')
			end,
		})

		NormalSectionRight:AddParagraph({
			Title = "Paragraph",
			Content = "Very cool paragraph\nAll elements in this section\nwill not be save to the config"
		})
	end;
end;

DrawElements(NormalTab,'right')

-- Single Tab --
local SingleTab = Window:DrawTab({
	Name = "Single Tab",
	Icon = "banana",
	Type = "Single"
});

DrawElements(SingleTab,'left')

-- Container Tab --
local ContainerTab = Window:DrawContainerTab({
	Name = "Extract Tabs",
	Icon = "contact",
});

local ExtractTab = ContainerTab:DrawTab({
	Name = "Tab 1",
	Type = "Double"
});

local SingleExtractTab = ContainerTab:DrawTab({
	Name = "Tab 2",
	Type = "Single",
	EnableScrolling = true, -- this will make tab can scrolling (recommend)
});

DrawElements(ExtractTab,"left");
DrawElements(ExtractTab,"right");

DrawElements(SingleExtractTab,"left");
DrawElements(SingleExtractTab,"right");

Window:DrawCategory({
	Name = "Misc"
});


local SettingTab = Window:DrawTab({
	Icon = "settings-3",
	Name = "Settings",
	Type = "Single"
});

local Settings = SettingTab:DrawSection({
	Name = "UI Settings"
});

Settings:AddColorPicker({
	Name = "Highlight",
	Default = Compkiller.Colors.Highlight,
	Callback = function(v)
		Compkiller:ChangeHighlightColor(v);
	end,
});

Settings:AddToggle({
	Name = "Alway Show Frame",
	Default = false,
	Callback = function(v)
		Window.AlwayShowTab = v;
	end,
});

-- Creating Config Tab --
local ConfigUI = Window:DrawConfig({
	Name = "Config",
	Icon = "folder",
	Config = ConfigManager
});

ConfigUI:Init();
