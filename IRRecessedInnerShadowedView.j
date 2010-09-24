//	IRRecessedInnerShadowedView.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRRecessedInnerShadowedView : IRStyledView {
	
	CPView backgroundViewBaseView;
	
}





- (CGRectOffset) visualBoundsOffset {
	
//	Override point for offset’d backdropped views.  A negative value in the offset means centrifugal.
//	i.e., a positive top offset means the final top border is higher than the previous border.	
	
	return CGRectOffsetMake(16, 0, 16, 0);
	
}





- (IRRecessedInnerShadowedView) initWithFrame:(CGRect)frame {
	
	CGRectDump(frame, @"IRRecessedInnerShadowedView initWithFrame");
	
	CPLog(@"top backdrop %@", [CPImage imageNamed:@"IRRecessedInnerShadowedView.topBackdrop.png" fromBundleResourcesOf:self]);
	
	self = [super initWithFrame:frame]; if (self == nil) return nil;
	
	[self setFrame:frame];
	
	[self setWantsLayer:YES];
	[self setLayer:[CALayer layer]];
	[[self layer] setBounds:frame];
	
	var fullFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);

	backgroundViewBaseView = [[CPView alloc] initWithFrame:CGRectTranslate(
		
		CGRectOffset(fullFrame, CGRectOffsetMake(0, 0, 0, 0)),
		{x: 0, y: 16}
		
	)];

	[backgroundView addSubview:backgroundViewBaseView];
	
	var topBackdropView = [[CPImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 32)];
	[topBackdropView setImage:[CPImage imageNamed:@"IRRecessedInnerShadowedView.topBackdrop.png" fromBundleResourcesOf:self]];
	[backgroundView addSubview:topBackdropView];		

	var bottomBackdropView = [[CPImageView alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 32)];
	[bottomBackdropView setImage:[CPImage imageNamed:@"IRRecessedInnerShadowedView.bottomBackdrop.png" fromBundleResourcesOf:self]];
	[backgroundView addSubview:bottomBackdropView];		

	return self;
	
}





- (CPColor) backgroundColor {
	
	return [backgroundViewBaseView backgroundColor];
	
}
- (void) setBackgroundColor:(CPColor)color {
	
	[backgroundViewBaseView setBackgroundColor:color];
	
}





@end