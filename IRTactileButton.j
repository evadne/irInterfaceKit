//	IRTactileButton.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
	kIRTactileButtonContinueStyle = @"IRTactileButtonContinueStyle",
	kIRTactileButtonNoOpStyle = @"IRTactileButtonNoOpStyle";
	
//	var	





@implementation IRTactileButton : CPButton {
	
	IRTactileButtonStyle style;
	
}

//	This is an abstract super class, not intended to be used directly
	
+ (id) buttonWithTitle:(CPString)inTitle style:(IRTactileButtonStyle)inStyle {

	var button = [super buttonWithTitle:inTitle theme:[CPTheme defaultTheme]]; if (button == nil) return nil;
	
	style = inStyle;
	
	[button setValue:[CPFont boldSystemFontOfSize:13.0] forThemeAttribute:@"font"];
	[button setValue:[CPColor colorWithWhite:1.0 alpha:1.0] forThemeAttribute:@"text-color"];
	[button setValue:[CPColor colorWithWhite:0.0 alpha:1.0] forThemeAttribute:@"text-shadow-color"];
	
	[button setValue:[CPColor colorWithWhite:0.95 alpha:1.0] forThemeAttribute:@"text-color" inState:CPThemeStateDisabled];
	[button setValue:[CPColor colorWithWhite:0.25 alpha:0.5] forThemeAttribute:@"text-shadow-color" inState:CPThemeStateDisabled];
	[button setValue:CGSizeMake(0.0, -1.0) forThemeAttribute:@"text-shadow-offset"];
	
	[button setValue:CGSizeMake(0.0, 32.0) forThemeAttribute:@"min-size"];
	[button setValue:CGSizeMake(-1.0, 32.0) forThemeAttribute:@"max-size"];
	
	[button setClipsToBounds:NO];
	
	return button;
	
}


@end