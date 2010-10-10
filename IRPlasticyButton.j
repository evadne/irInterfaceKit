//	IRPlasticyButton.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
	kIRPlasticyDefaultButtonStyle = @"IRPlasticyDefaultButton";
	
	
	
	
	
@implementation IRPlasticyButton : CPButton {
	
	IRPlasticyButtonStyle style;
	
}





+ (CGInset) insetsForStyle:(IRPlasticyButtonStyle)style {
	
	switch (style) {
		
		case kIRPlasticyDefaultButtonStyle:
		return {
				
			bezelColor: CGInsetMake(8, 8, 8, 8),
			bezel: CGInsetMake(-4, -4, -4, -4),
			content: CGInsetMake(0, 16, 0, 16),
			activeCcontent: CGInsetMake(0, 16, 0, 16)
		
		}
		
	}
	
	return null;
	
}





+ (id) buttonWithTitle:(CPString)inTitle {

	return [self buttonWithTitle:inTitle style:kIRPlasticyDefaultButtonStyle];

}

+ (id) buttonWithTitle:(CPString)inTitle style:(IRPlasticyButtonStyle)inStyle {

	var button = [super buttonWithTitle:inTitle theme:[CPTheme defaultTheme]]; if (button == nil) return nil;
	
	style = inStyle;
	
	var bundle = [CPBundle bundleForClass:[self class]];
	var insets = [self insetsForStyle:inStyle];
	
	var bezelColorInset = insets.bezelColor;
	var bezelInset = insets.bezel;
	var contentInset = insets.content;
	var activeContentInset = insets.activeCcontent;
	
	var color = function (inSuffix) {
		
		return [CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:[style stringByAppendingString:inSuffix] inBundle:[CPBundle bundleForClass:[self class]] withInset:bezelColorInset]];
		
	}
	
	[button setValue:color(@".backdrop") forThemeAttribute:@"bezel-color"];
	[button setValue:color(@".backdrop.active") forThemeAttribute:@"bezel-color" inState:CPThemeStateHighlighted];
	[button setValue:color(@".backdrop.disabled") forThemeAttribute:@"bezel-color" inState:CPThemeStateDisabled];
	[button setValue:bezelInset forThemeAttribute:@"bezel-inset"];
	[button setValue:contentInset forThemeAttribute:@"content-inset"];
	[button setValue:activeContentInset forThemeAttribute:@"content-inset" inState:CPThemeStateHighlighted];
	
	[button setValue:[CPFont systemFontOfSize:13.0] forThemeAttribute:@"font"];
	[button setValue:[CPColor colorWithWhite:1.0 alpha:1.0] forThemeAttribute:@"text-color"];
	[button setValue:[CPColor colorWithWhite:0.95 alpha:0.5] forThemeAttribute:@"text-color" inState:CPThemeStateDisabled];

	[button setValue:[CPColor clearColor] forThemeAttribute:@"text-shadow-color"];
	
	[button setValue:CGSizeMake(0.0, 24.0) forThemeAttribute:@"min-size"];
	[button setValue:CGSizeMake(-1.0, 24.0) forThemeAttribute:@"max-size"];
	
	[button setClipsToBounds:NO];
	
	return button;
	
}

@end