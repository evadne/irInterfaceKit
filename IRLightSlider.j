//	IRLightSlider.j
//	Evadne Wu at Iridia, 2010





@implementation IRLightSlider : CPSlider





+ (IRLightSlider) verticalSlider {
	
	var slider = [[IRLightSlider alloc] initWithFrame:CGRectMake(0.0, 0.0, 48.0, 256.0)];
	
	
	[slider setValue:[CPColor colorWithPatternImage:[CPImage imageNamed:@"IRLightSlider.track.knob.vertical.png" inBundleOf:self]] forThemeAttribute:@"knob-color"];

	[slider setValue:[CPColor colorWithPatternImage:[CPImage imageNamed:@"IRLightSlider.track.knob.vertical.disabled.png" inBundleOf:self]] forThemeAttribute:@"knob-color" inState:CPThemeStateDisabled];
	
	[slider setValue:[CPColor colorWithPatternImage:[CPImage imageNamed:@"IRLightSlider.track.knob.vertical.active.png" inBundleOf:self]] forThemeAttribute:@"knob-color" inState:CPThemeStateHighlighted];
	
	[slider setValue:CGSizeMake(32.0, 16.0) forThemeAttribute:@"knob-size"];
	
	
	[slider setValue:32.0 forThemeAttribute:@"track-width"];
	[slider setValue:[CPColor redColor] forThemeAttribute:@"track-color"];
	
	[slider setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRLightSlider.track.vertical" inBundleOf:self withInset:CGInsetMake(8, 0, 8, 0) thickness:32.0 vertical:YES]] forThemeAttribute:@"track-color" inState:CPThemeStateVertical];

	[slider setValue:[CPColor colorWithPatternImage:[CPThreePartImage imageWithBaseName:@"IRLightSlider.track.vertical.disabled" inBundleOf:self withInset:CGInsetMake(8, 0, 8, 0) thickness:32.0 vertical:YES]] forThemeAttribute:@"track-color" inState:CPThemeStateVertical|CPThemeStateDisabled];
	
		
	return slider;

}





- (float) _valueAtPoint:(CGPoint)aPoint {
	
	if ([self isContinuous]) return [super _valueAtPoint:aPoint];
	return Math.floor([super _valueAtPoint:aPoint]);
	
}





@end




