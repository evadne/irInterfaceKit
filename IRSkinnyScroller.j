//	IRSkinnyScroller.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRSkinnyScroller : CPScroller {
	
	BOOL invertedColor;
	
}





+ (float) scrollerWidth {

	return 24.0;

}

+ (float) scrollerWidthForControlSize:(CPControlSize)aControlSize {

	return 24.0;

}







- (IRSkinnyScroller) initWithFrame:(CGRect)inFrame {
	
	self = [super initWithFrame:inFrame]; if (self == nil) return nil;
	
	[self setValue:CGInsetMake(0.0, 0.0, 0.0, 0.0) forThemeAttribute:@"knob-inset"];
	[self setValue:CGInsetMake(0.0, 0.0, 0.0, 0.0) forThemeAttribute:@"track-inset"];

	[self setValue:[CPNull null] forThemeAttribute:@"knob-slot-color"];
	
	[self setValue:CGSizeMake(8.0, 8.0) forThemeAttribute:@"increment-line-size"];
//	[self setValue:CGSizeMake(0.0, 0.0) forThemeAttribute:@"increment-line-size" inState:CPThemeStateVertical];
	
	[self setValue:CGSizeMake(8.0, 8.0) forThemeAttribute:@"decrement-line-size"];
//	[self setValue:CGSizeMake(0.0, 0.0) forThemeAttribute:@"decrement-line-size" inState:CPThemeStateVertical];
	
	[self setValue:[CPNull null] forThemeAttribute:@"increment-line-color"];
	[self setValue:[CPNull null] forThemeAttribute:@"decrement-line-color"];

	  
	return self;
	
}





- (BOOL) invertedColor {
	
	return invertedColor;
	
}

- (void) setInvertedColor:(BOOL)flag {
	
	invertedColor = flag;
	
	if (invertedColor) {
		
		[self setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRSkinnyScroller.light.backdrop.horizontal" inBundleOf:self withInset:CGInsetMake(0.0, 8.0, 0.0, 8.0) thickness:24.0 vertical:NO]] forThemeAttribute:@"knob-color"];

		[self setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRSkinnyScroller.light.backdrop.horizontal.active" inBundleOf:self withInset:CGInsetMake(0.0, 8.0, 0.0, 8.0) thickness:24.0 vertical:NO]] forThemeAttribute:@"knob-color" inState:CPThemeStateHighlighted];

		[self setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRSkinnyScroller.light.backdrop.vertical" inBundleOf:self withInset:CGInsetMake(8.0, 0.0, 8.0, 0.0) thickness:24.0 vertical:YES]] forThemeAttribute:@"knob-color" inState:CPThemeStateVertical];
	
		[self setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRSkinnyScroller.light.backdrop.vertical.active" inBundleOf:self withInset:CGInsetMake(8.0, 0.0, 8.0, 0.0) thickness:24.0 vertical:YES]] forThemeAttribute:@"knob-color" inState:CPThemeStateVertical|CPThemeStateHighlighted];
		
	} else {
			
		[self setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRSkinnyScroller.dark.backdrop.horizontal" inBundleOf:self withInset:CGInsetMake(0.0, 8.0, 0.0, 8.0) thickness:24.0 vertical:NO]] forThemeAttribute:@"knob-color"];

		[self setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRSkinnyScroller.dark.backdrop.horizontal.active" inBundleOf:self withInset:CGInsetMake(0.0, 8.0, 0.0, 8.0) thickness:24.0 vertical:NO]] forThemeAttribute:@"knob-color" inState:CPThemeStateHighlighted];

		[self setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRSkinnyScroller.dark.backdrop.vertical" inBundleOf:self withInset:CGInsetMake(8.0, 0.0, 8.0, 0.0) thickness:24.0 vertical:YES]] forThemeAttribute:@"knob-color" inState:CPThemeStateVertical];
	
		[self setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRSkinnyScroller.dark.backdrop.vertical.active" inBundleOf:self withInset:CGInsetMake(8.0, 0.0, 8.0, 0.0) thickness:24.0 vertical:YES]] forThemeAttribute:@"knob-color" inState:CPThemeStateVertical|CPThemeStateHighlighted];
	
	}
	
}

@end




