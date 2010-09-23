//	IRStyledView.j
//	Evadne Wu at Iridia, 2010
	
@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
	
	
	
	
	
@implementation IRStyledView : CPView {

//	Notice: IRBorder is a base type.

	// IRBorder _topBorder @accessors(property=topBorder);
	// IRBorder _rightBorder @accessors(property=rightBorder);
	// IRBorder _bottomBorder @accessors(property=bottomBorder);
	// IRBorder _leftBorder @accessors(property=leftBorder);
	
//	IRShadow _shadow;

//	Simply setting a backgroundColor makes the view’s background solid.
//	Setting any of the two gradient colors makes the background a gradient.
	
	// CPColor gradientStartColor @accessors;
	// CPColor gradientEndColor @accessors;
	// CPColor backgroundColor @accessors;
	
	CPView backgroundView;
	CPView contentView;
	
	CGRectOffset visualBoundsOffset;
//	CGRect visualBounds;
	
}





- (CGRectOffset) visualBoundsOffset {
	
//	Override point for offset’d backdropped views.  A negative value in the offset means centrifugal.
//	i.e., a positive top offset means the final top border is higher than the previous border.	
	
	return CGRectOffsetZero();
	
}





- (IRStyledView) initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame]; if (self == nil) return nil;
	[self setFrame:CGRectOffset(frame, [self visualBoundsOffset])];


	var enlargedBackgroundViewFrame = CGRectOffset(CGRectMake(
		
		[self visualBoundsOffset].topOffset,
		[self visualBoundsOffset].leftOffset,
		frame.size.width,
		frame.size.height
		
	), [self visualBoundsOffset]);
	
	backgroundView = [[CPView alloc] initWithFrame:enlargedBackgroundViewFrame];
	
	[backgroundView setBackroundColor:[CPColor blueColor]];
	
	contentView = [[CPView alloc] initWithFrame:CGRectMake(
		
		[self visualBoundsOffset].topOffset,
		[self visualBoundsOffset].leftOffset,
		frame.size.width,
		frame.size.height
		
	)];
	
	
	[self addSubview:backgroundView];	
	[self addSubview:contentView];
	
	return self;
	
}





// - (void) setTopBorder:(IRBorder)topBorder {		_topBorder = topBorder;		}
// - (void) setRightBorder:(IRBorder)rightBorder {		_rightBorder = rightBorder;	}
// - (void) setBottomBorder:(IRBorder)bottomBorder {	_bottomBorder = bottomBorder;	}
// - (void) setLeftBorder:(IRBorder)leftBorder {		_leftBorder = leftBorder;	}





// - (void) drawRect:(CGRect)rect {
// 
// 	CGContextDrawLinearGradient(
// 		
// 		[[CPGraphicsContext currentContext] graphicsPort],
// 		
// 		CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [gradientStartColor, gradientEndColor], NULL), 
// 		
// 		rect.origin,
// 		CGPointOffset(rect.origin, rect.size.width, rect.size.height), 
// 		
// 		0
// 		
// 	);
// 	
// }





@end