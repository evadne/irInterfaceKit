//	IRTactileContinueButton.j
//	Evadne Wu at Iridia, 2010
	
@import "IRTactileButton.j"
	
	
	
	
	
@implementation IRTactileContinueButton : IRTactileButton 





+ (id) buttonWithTitle:(CPString)title {
	
	var button = [super buttonWithTitle:title style:kIRTactileButtonContinueStyle];
	
	[button setValue:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:[CPStringFromClass([self class]) stringByAppendingString:@".backdrop"] inBundle:[CPBundle bundleForClass:[self class]] withInset:CGInsetMake(20, 36, 20, 20)]] forThemeAttribute:@"bezel-color"];
	
	[button setValue:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:[CPStringFromClass([self class]) stringByAppendingString:@".backdrop.active"] inBundle:[CPBundle bundleForClass:[self class]] withInset:CGInsetMake(20, 36, 20, 20)]] forThemeAttribute:@"bezel-color" inState:CPThemeStateHighlighted];
	
	[button setValue:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:[CPStringFromClass([self class]) stringByAppendingString:@".backdrop.disabled"] inBundle:[CPBundle bundleForClass:[self class]] withInset:CGInsetMake(20, 36, 20, 20)]] forThemeAttribute:@"bezel-color" inState:CPThemeStateDisabled];
	
		
	[button setValue:CGInsetMake(0, 28, 0, 16) forThemeAttribute:@"content-inset"];
	[button setValue:CGInsetMake(1, 28, 0, 16) forThemeAttribute:@"content-inset" inState:CPThemeStateHighlighted];
	
	[button setValue:CGInsetMake(-16, -12, -16, -16) forThemeAttribute:@"bezel-inset"];
	
	[button sizeToFit];
	
	return button;
	
}

@end