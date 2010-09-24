//	IRDarkTextField.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRDarkTextField : CPTextField

- (CGRectOffset) visualBoundsOffset {
	
	return CGRectOffsetMake(4, 4, 4, 4);
	
}

+ (IRTextField) textFieldWithStringValue:(CPString)aStringValue placeholder:(CPString)aPlaceholder width:(float)aWidth height:(float)aHeight theme:(CPTheme)aTheme {

	var textField = [super textFieldWithStringValue:aStringValue placeholder:aPlaceholder width:aWidth theme:aTheme]
	
	[textField setValue:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:@"IRDarkTextField.backdrop" inBundle:[CPBundle bundleForClass:[self class]] withInset:CGInsetMake(12, 12, 12, 12)]] forThemeAttribute:@"bezel-color" inState:CPThemeStateBezeled];
	
	[textField setValue:CGInsetMake(12, 20, 12, 20) forThemeAttribute:@"content-inset" inState:CPThemeStateBezeled];
	[textField setValue:CGInsetMake(4, 4, 4, 4) forThemeAttribute:@"bezel-inset" inState:CPThemeStateBezeled];
	
	[textField setValue:CGInsetMake(4, 4, 4, 4) forThemeAttribute:@"bezel-inset" inState:CPThemeStateBezeled|CPThemeStateEditing];
	
	[textField setValue:[CPFont boldSystemFontOfSize:12.0] forThemeAttribute:@"font" inState:CPThemeStateBezeled];
	[textField setValue:[CPColor colorWithWhite:1 alpha:1] forThemeAttribute:"text-color" inState:CPThemeStateBezeled];
	[textField setValue:CPCenterTextAlignment forThemeAttribute:@"alignment" inState:CPThemeStateBezeled&CPThemeStateEditing];
	
	[textField setValue:[CPColor colorWithWhite:.5 alpha:1] forThemeAttribute:@"text-color" inState:CPTextFieldStatePlaceholder];

	[textField setBezeled:YES];

	
	[textField setVisualFrame:CGRectMake(0.0, 0.0, aWidth, aHeight)];
	[textField setValue:CPCenterVerticalTextAlignment forThemeAttribute:@"vertical-alignment"];
	
	return textField;

}

@end