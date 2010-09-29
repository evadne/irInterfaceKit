//	IRBubbleBox.j
//	Evadne Wu at Iridia, 2010

@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"
	
	
	
	
	
@implementation IRBubbleBox : IRStyledView {
	
	
	
}

- (IRBubbleBox) initWithFrame:(CGRect)aFrame {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;
	
	[backgroundView setBackgroundNinePartPatternImageNamed:@"IRBubbleBox.backdrop" sliceTop:24 right:96 bottom:24 left:24 sender:self];
	
	[backgroundView setFrame:CGRectOffset(CGRectMake(0, 0, aFrame.size.width, aFrame.size.height), CGRectOffsetMake(16, 16, 16, 16))];
	
	[backgroundView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
			
	return self;
	
}





@end