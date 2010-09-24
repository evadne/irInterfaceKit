//	IRTextField.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRTextField : CPTextField

+ (CPTextField) textFieldWithStringValue:(CPString)aStringValue placeholder:(CPString)aPlaceholder width:(float)aWidth theme:(CPTheme)aTheme {

	var textField = [super textFieldWithStringValue:aStringValue placeholder:aPlaceholder width:aWidth theme:aTheme]
	
	[textField setFrame:CGRectMake(0.0, 0.0, aWidth, 48.0)];

	return textField;

}

@end