//	IRDarkSearchfield.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRDarkSearchField : CPTextField

+ (IRDarkSearchField) searchFieldWithStringValue:(CPString)aStringValue placeholder:(CPString)aPlaceholder width:(float)aWidth {

	var textField = [super textFieldWithStringValue:aStringValue placeholder:aPlaceholder width:aWidth theme:[CPTheme defaultTheme]];
	
	[textField setFrame:CGRectMake(0.0, 0.0, aWidth, 24.0)];
	
	[textField setValue:[CPColor blueColor] forThemeAttribute:@"bezel-color"];
	
	[textField setBezeled:YES];
	
	[textField setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRDarkSearchField.backdrop" inBundleOf:self withInset:CGInsetMake(0, 16, 0, 32) thickness:32.0 vertical:NO]] forThemeAttribute:@"bezel-color"];
	[textField setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRDarkSearchField.backdrop.active" inBundleOf:self withInset:CGInsetMake(0, 16, 0, 32) thickness:32.0 vertical:NO]] forThemeAttribute:@"bezel-color" inState:CPThemeStateEditing];
	[textField setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRDarkSearchField.backdrop.disabled" inBundleOf:self withInset:CGInsetMake(0, 16, 0, 32) thickness:32.0 vertical:NO]] forThemeAttribute:@"bezel-color" inState:CPThemeStateDisabled];
		
	[textField setValue:CGInsetMake(0, 16, 0, 32) forThemeAttribute:@"content-inset"];
	[textField setValue:CGInsetMake(-4, -4, -4, -4) forThemeAttribute:@"bezel-inset"];

	[textField setValue:[CPFont systemFontOfSize:13.0] forThemeAttribute:@"font"];	
	[textField setValue:CPLeftTextAlignment forThemeAttribute:@"alignment"];
	[textField setValue:CPCenterVerticalTextAlignment forThemeAttribute:@"vertical-alignment"];
	[textField setValue:CPLineBreakByTruncatingTail forThemeAttribute:@"line-break-mode"];

	[textField setValue:[CPColor colorWithWhite:1 alpha:.95] forThemeAttribute:"text-color"];
	[textField setValue:[CPColor colorWithWhite:1 alpha:.75] forThemeAttribute:@"text-color" inState:CPTextFieldStatePlaceholder];
	[textField setValue:[CPColor colorWithWhite:1 alpha:1] forThemeAttribute:"text-color" inState:CPThemeStateEditing];
	[textField setValue:[CPColor colorWithWhite:1 alpha:0.5] forThemeAttribute:"text-color" inState:CPThemeStateDisabled];
	
	
	[textField setValue:CGSizeMake(-1.0, 24.0) forThemeAttribute:@"min-size"];
	[textField setValue:CGSizeMake(-1.0, 24.0) forThemeAttribute:@"max-size"];
	
	[textField sizeToFit];
	
	[textField setClipsToBounds:NO];
	
	return textField;

}

@end