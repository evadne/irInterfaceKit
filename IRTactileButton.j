//	IRTactileButton.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
	kIRTactileContinueButtonStyle = @"IRTactileContinueButton",
	kIRTactileNoOpButtonStyle = @"IRTactileNoOpButton";
	kIRTactileSecondActionButtonStyle = @"IRTactileSecondActionButton";
	kIRTactilePreviousButtonStyle = @"IRTactilePreviousButton";
	kIRTactileDoneButtonStyle = @"IRTactileDoneButton";
	
@implementation IRTactileButton : CPButton {
	
	IRTactileButtonStyle style;
	
}





+ (CGInset) insetsForStyle:(id)style {
	
	switch (style) {
		
		case kIRTactileContinueButtonStyle:
		return {
				
			bezelColor: CGInsetMake(20, 40, 20, 20),
			bezel: CGInsetMake(-16, -12, -16, -16),
			content: CGInsetMake(0, 28, 0, 16),
			activeCcontent: CGInsetMake(1, 28, 0, 16)
			
		};
		
		case kIRTactileNoOpButtonStyle:
		case kIRTactileSecondActionButtonStyle:
		case kIRTactileDoneButtonStyle:
		return {
				
			bezelColor: CGInsetMake(20, 20, 20, 20),
			bezel: CGInsetMake(-16, -16, -16, -16),
			content: CGInsetMake(0, 16, 0, 16),
			activeCcontent: CGInsetMake(1, 16, 0, 16)
			
		};
		
		case kIRTactilePreviousButtonStyle:
		return {
				
			bezelColor: CGInsetMake(20, 20, 20, 40),
			bezel: CGInsetMake(-16, -16, -16, -12),
			content: CGInsetMake(0, 16, 0, 28),
			activeCcontent: CGInsetMake(1, 16, 0, 28)
			
		};
		
	}
	
	return null;
	
}




	
+ (id) buttonWithTitle:(CPString)inTitle style:(IRTactileButtonStyle)inStyle {

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










@implementation IRTactileContinueButton : IRTactileButton 

+ (id) buttonWithTitle:(CPString)title {
	
	var button = [super buttonWithTitle:title style:kIRTactileContinueButtonStyle];
	[button sizeToFit];	
	return button;
	
}

@end

@implementation IRTactileNoOpButton : IRTactileButton 

+ (id) buttonWithTitle:(CPString)title {
	
	var button = [super buttonWithTitle:title style:kIRTactileNoOpButtonStyle];
	[button sizeToFit];	
	return button;
	
}

@end

@implementation IRTactileSecondActionButton : IRTactileButton 

+ (id) buttonWithTitle:(CPString)title {
	
	var button = [super buttonWithTitle:title style:kIRTactileSecondActionButtonStyle];
	[button sizeToFit];	
	return button;
	
}

@end

@implementation IRTactilePreviousButton : IRTactileButton 

+ (id) buttonWithTitle:(CPString)title {
	
	var button = [super buttonWithTitle:title style:kIRTactilePreviousButtonStyle];
	[button sizeToFit];	
	return button;
	
}

@end

@implementation IRTactileDoneButton : IRTactileButton 

+ (id) buttonWithTitle:(CPString)title {
	
	var button = [super buttonWithTitle:title style:kIRTactileDoneButtonStyle];
	[button sizeToFit];	
	return button;
	
}

@end









