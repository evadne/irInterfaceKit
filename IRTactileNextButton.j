//	IRTactileNextButton.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRTactileNextButton : CPButton {
	
	
	
}





+ (id) buttonWithTitle:(CPString)title theme:(CPTheme)theme {
	
	var button = [super buttonWithTitle:title theme:theme];
	
	[button setValue:[CPFont boldSystemFontOfSize:13.0] forThemeAttribute:@"font"];
	[button setValue:[CPColor colorWithWhite:1.0 alpha:1.0] forThemeAttribute:@"text-color"];
	[button setValue:[CPColor colorWithWhite:0.0 alpha:1.0] forThemeAttribute:@"text-shadow-color"];
	[button setValue:CGSizeMake(0.0, -1.0) forThemeAttribute:@"text-shadow-offset"];
	
	[button setValue:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:@"IRTactileNextButton.backdrop" inBundle:[CPBundle bundleForClass:[self class]] withInset:CGInsetMake(20, 28, 20, 20)]] forThemeAttribute:@"bezel-color"];
	
	[button setValue:CGInsetMake(0, 28, 0, 24) forThemeAttribute:@"content-inset"];
	[button setValue:CGInsetMake(-16, -8, -16, -16) forThemeAttribute:@"bezel-inset"];
	
	[button setValue:CGSizeMake(0.0, 32.0) forThemeAttribute:@"min-size"];
	[button setValue:CGSizeMake(-1.0, 32.0) forThemeAttribute:@"max-size"];

	[button setClipsToBounds:NO];	
//	Can’t believe I spent quite a lot of time implementing the rubbish visualBounds thing.
//	It’s Cappuccino, which works the DOM.  And there is never necessity to calculate “visual bounds”.
//	Just de-clip it, mate!
	
	[button sizeToFit];
	
	return button;
	
}

@end