//	IRStyledView.j
//	Evadne Wu at Iridia, 2010
	
@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
	
	
	
	
	
@implementation IRStyledView : CPView {

	CPView backgroundView;
	CPView contentView @accessors(readonly);
	
}





- (IRStyledView) initWithFrame:(CGRect)frame {
		
	self = [super initWithFrame:frame]; if (self == nil) return nil;
	
	var fullFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);

	backgroundView = [[CPView alloc] initWithFrame:fullFrame];
	[self addSubview:backgroundView];
	[backgroundView setHitTests:NO];

	contentView = [[CPView alloc] initWithFrame:fullFrame];	
	[self addSubview:contentView];
	
	[self setClipsToBounds:NO];
	
	return self;
	
}





@end




