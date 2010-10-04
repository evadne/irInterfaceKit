//	IRIndicatorBar
	
@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"
@import "IRIndicatorBarElement.j"






@implementation IRIndicatorBar : IRStyledView {

	CPArray steps;
	int activeStep;

}





- (IRIndicatorBar) initWithFrame:(CGRect)aFrame {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;
	
	var genericBarBackdrop = [[IRGenericBar alloc] initWithFrame:CGRectOffset(CGRectMake(0, 0, aFrame.size.width, aFrame.size.height), CGRectOffsetMake(0, 0, 0, 0))];
	
	[genericBarBackdrop setAutoresizingMask:CPViewWidthSizable];
	
	[backgroundView addSubview:genericBarBackdrop];	
	[backgroundView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	
	[contentView setClipsToBounds:NO];
	
	steps = [CPMutableArray array];
	activeStep = NULL;

	return self;

}

- (void) setSteps:(CPArray)inSteps {
	
	var enumerator = [steps objectEnumerator]; var object; while (object = [enumerator nextObject]){
		
		[object removeFromSuperview];
		
	}
	
	var enumerator = [inSteps objectEnumerator]; var object; while (object = [enumerator nextObject]){
		
		unLaidSubview = [[IRIndicatorBarElement alloc] initWithFrame:CGRectMake(0, 0, 128, 32) title:object];
		[contentView addSubview:unLaidSubview];
		
		[steps addObject:unLaidSubview];
		
	}
	
	[self setNeedsLayout];
	
}

- (void) layoutSubviews {
	
	var totalWidth = [steps count] * 128;
	var paddingLeft = 0.5 * (CGRectGetWidth([self frame]) - totalWidth);
	
	var enumerator = [steps objectEnumerator]; var object;
	while (object = [enumerator nextObject]) {
	
		[object setFrameOrigin:CGPointMake(paddingLeft, 0)];
		paddingLeft += 128;
		
	}
	
}

- (void) setActiveStep:(int)index {
	
	[[steps objectAtIndex:activeStep] setActive:NO];
	[[steps objectAtIndex:index] setActive:YES];
	
	activeStep = index;
	
}





@end