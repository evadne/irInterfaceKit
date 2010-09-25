//	IRTactileContinueButton.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRTactileContinueButton : CPButton {
	
	
	
}





+ (id) buttonWithTitle:(CPString)title theme:(CPTheme)theme {
	
	var button = [super buttonWithTitle:title theme:theme];
	
	[button setValue:[CPFont boldSystemFontOfSize:13.0] forThemeAttribute:@"font"];
	[button setValue:[CPColor colorWithWhite:1.0 alpha:1.0] forThemeAttribute:@"text-color"];
	[button setValue:[CPColor colorWithWhite:0.0 alpha:1.0] forThemeAttribute:@"text-shadow-color"];
	
	[button setValue:[CPColor colorWithWhite:0.95 alpha:1.0] forThemeAttribute:@"text-color" inState:CPThemeStateDisabled];
	[button setValue:[CPColor colorWithWhite:0.25 alpha:0.5] forThemeAttribute:@"text-shadow-color" inState:CPThemeStateDisabled];
	[button setValue:CGSizeMake(0.0, -1.0) forThemeAttribute:@"text-shadow-offset"];

	
	[button setValue:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:@"IRTactileContinueButton.backdrop" inBundle:[CPBundle bundleForClass:[self class]] withInset:CGInsetMake(20, 36, 20, 20)]] forThemeAttribute:@"bezel-color"];

	[button setValue:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:@"IRTactileContinueButton.backdrop.active" inBundle:[CPBundle bundleForClass:[self class]] withInset:CGInsetMake(20, 36, 20, 20)]] forThemeAttribute:@"bezel-color" inState:CPThemeStateHighlighted];
	
	[button setValue:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:@"IRTactileContinueButton.backdrop.disabled" inBundle:[CPBundle bundleForClass:[self class]] withInset:CGInsetMake(20, 36, 20, 20)]] forThemeAttribute:@"bezel-color" inState:CPThemeStateDisabled];
	
	
	
	[button setValue:CGInsetMake(0, 28, 0, 16) forThemeAttribute:@"content-inset"];
	[button setValue:CGInsetMake(1, 28, 0, 16) forThemeAttribute:@"content-inset" inState:CPThemeStateHighlighted];
	
	[button setValue:CGInsetMake(-16, -12, -16, -16) forThemeAttribute:@"bezel-inset"];
	
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