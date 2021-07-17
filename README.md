# DefaultDermaLibary
The best and simplest UI for Garry's Mod in the world!

## Example
```lua
CreateClientConVar("CheckBox", "false", true, true)
CreateClientConVar("Switch", "false", true, true)
CreateClientConVar("BinderKey", "NONE", true, true)
CreateClientConVar("SliderNum", 30, true, true)

concommand.Add("Test", function()
	frame = DLib.Frame(-1, -1, 600, 400, "Default GUI")

	local button = DLib.Button(frame, 5, 15, 120, 22, DLib.RoundingPower, DLib.Color.Top, "Button")
	button.DoClick = function()
		LocalPlayer():ChatPrint("Why do you click this?")
		DLib.Sound("buttons/button9.wav", 0.4)
	end

	DLib.CheckBox(frame, 15, 50, "CheckBox")
	DLib.Switch(frame, 15, 80, "Switch")
	DLib.Binder(frame, 15, 110, "BinderKey")
	DLib.Slider(frame, 15, 140, 250, 40, 1, 255, "SliderNum")
	DLib.ColorPicker(frame, 15, 260)
end)
```

## Result
![alt-text](https://i.imgur.com/a2RwXDz.png)

## Usage
Main Window

```DLib.Frame(coordinate x, coordinate y, width, height, title)```

Button

```DLib.Button(mainframe, coordinate x, coordinate y, width, height, rounding, color, text)```

Checkbox

```DLib.CheckBox(mainframe, coordinate x, coordinate y, convar)```

Switch (Checkbox with another style)

```DLib.Switch(mainframe, coordinate x, coordinate y, convar)```

Key Binder

```DLib.Binder(mainframe, coordinate x, coordinate y, convar)```

Slider

```DLib.Slider(mainframe, coordinate x, coordinate y, width, height, minValue, maxValue, convar)```

Color Picker

```DLib.ColorPicker(mainframe, coordinate x, coordinate y)```

## Credits
Default#7736 - Main work

crester#2077 - Help with DColorMixer

Artemking4#5024 - Help with fix lua shit

## P.S. My first Lua work, do not yell at me pls. You can use this, but please, do not remove/edit my marks!
