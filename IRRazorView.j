//	IRRazorView.j





@implementation IRRazorView : CPView 

- (IRRazorView) initWithFrame:(CGRect)inFrame {
	
	self = [super initWithFrame:CGRectMake(
		
		inFrame.origin.x, 
		inFrame.origin.y, 
		32, 
		inFrame.size.height
		
	)]; if (self == nil) return nil;
	
	[self setBackgroundPatternImageNamed:@"IRRazorView.backdrop.vertical"];
	
	return self;
	
}

@end