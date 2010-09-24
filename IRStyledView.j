//	IRStyledView.j
//	Evadne Wu at Iridia, 2010
	
@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import <CappExperiments/MethodSwizzle/MethodSwizzle.j>
	
	
	
	
	
@implementation IRStyledView : CPView {

	CPView backgroundView;
	CPView contentView @accessors(readonly);
	
	BOOL hasUsedSwizzledFrame;
	
}





- (IRStyledView) initWithFrame:(CGRect)frame {
		
	self = [super initWithFrame:frame]; if (self == nil) return nil;
	
	backgroundView = [[CPView alloc] initWithFrame:CGRectMakeZero()];
	contentView = [[CPView alloc] initWithFrame:CGRectMakeZero()];
	
	[self addSubview:backgroundView];	
	[self addSubview:contentView];
	
	[self setFrame:frame];
	
	return self;
	
}





- (void) setFrame:(CGRect)frame {
	
	[super setFrame:frame];
	
	var fullFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
	[backgroundView setFrame:fullFrame];
	[contentView setFrame:CGRectOffset(fullFrame, CGRectOffsetInvert([self visualBoundsOffset]))];
	
}





@end




