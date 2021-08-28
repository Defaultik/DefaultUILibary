# DefaultDermaLibrary
Simplest UI with animations for Garry's Mod.

## How i can use this?
You can create anything with my UI, from F4 to Admin System.

## Example
```lua
CreateClientConVar("CheckBox", "false", true, true)
CreateClientConVar("Switch", "false", true, true)
CreateClientConVar("BinderKey", "NONE", true, true)
CreateClientConVar("SliderNum", 30, true, true)

concommand.Add("Test", function()
	local frame = DLib.Frame(-1, -1, 600, 400, "Default GUI")
	
	local button = DLib.Button(frame, 5, 15, 120, 22, DLib.RoundingPower, DLib.Color.Top, "Button")
	function button:DoClick()
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

### Result
![alt-text](https://i.imgur.com/a2RwXDz.png)

# Usage
Main Window

```DLib.Frame(coordinate x, coordinate y, width, height, title)```
[(Result)](https://i.imgur.com/dt4uxda.png)

Button

```DLib.Button(mainframe, coordinate x, coordinate y, width, height, rounding, color, text)```
[(Result)](https://i.imgur.com/in0z7FJ.gif)

Checkbox

```DLib.CheckBox(mainframe, coordinate x, coordinate y, convar)```
[(Result)](https://i.imgur.com/J8hcTtA.gif)

Switch (Checkbox with another style)

```DLib.Switch(mainframe, coordinate x, coordinate y, convar)```
[(Result)](https://i.imgur.com/wolgQ0C.gif)

Key Binder

```DLib.Binder(mainframe, coordinate x, coordinate y, convar)```
[(Result)](https://i.imgur.com/skRT04K.gif)

Slider

```DLib.Slider(mainframe, coordinate x, coordinate y, width, height, minValue, maxValue, convar)```
[(Result)](https://i.imgur.com/l5O4Yyz.gif)

Color Picker

```DLib.ColorPicker(mainframe, coordinate x, coordinate y)```
[(Result)](https://i.imgur.com/S6UyE0B.gif)

### Credits
Default#7736 - Main work

crester#2077 - Help with DColorMixer

Artemking4#5024 - Help with fix lua shit
