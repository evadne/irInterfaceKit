//	IRRecessedInnerShadowedView.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRRecessedInnerShadowedView : IRStyledView {
	
	CPView backgroundViewBaseView;
	
}





- (IRRecessedInnerShadowedView) initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame]; if (self == nil) return nil;

	var topBackdropView = [[CPImageView alloc] initWithFrame:CGRectMake(0, -16, frame.size.width, 32)];
	[self addSubview:topBackdropView];
	[topBackdropView setImage:[CPImage imageNamed:@"IRRecessedInnerShadowedView.topBackdrop.png" inBundleOf:self]];
	[topBackdropView setAutoresizingMask:CPViewMinXMargin|CPViewMaxXMargin|CPViewMinYMargin];

	var bottomBackdropView = [[CPImageView alloc] initWithFrame:CGRectMake(0, frame.size.height - 16, frame.size.width, 32)];
	[self addSubview:bottomBackdropView];
	[bottomBackdropView setImage:[CPImage imageNamed:@"IRRecessedInnerShadowedView.bottomBackdrop.png" inBundleOf:self]];
	[bottomBackdropView setAutoresizingMask:CPViewMinXMargin|CPViewMaxXMargin|CPViewMaxYMargin];

	[self setClipsToBounds:NO];

	return self;
	
}





@end