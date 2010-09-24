//	IRRecessedInnerShadowedView.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRRecessedInnerShadowedView : IRStyledView





- (IRRecessedInnerShadowedView) initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame]; if (self == nil) return nil;

	var upperShadowView = [[CPView alloc] initWithFrame:CPRectMake(0, 0, [self frame].size.width, 8)];
	[upperShadowView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewWidthSizable];
//	[upperShadowView setBackgroundColor:[CPColor blackColor]];
	[self addSubview:upperShadowView];

	var lowerShadowView = [[CPView alloc] initWithFrame:CGRectMake(0, [self frame].size.height - 8, [self frame].size.width, 8)];
	
	[lowerShadowView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMaxYMargin | CPViewWidthSizable];
//	[lowerShadowView setBackgroundColor:[CPColor redColor]];
	[self addSubview:lowerShadowView];
	
	return self;
	
}





@end