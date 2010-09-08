//	IRStyledView.j
//	Evadne Wu at Iridia, 2010
	
@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
	
	
	
	
	
@implementation IRStyledView : CPView {

//	Notice: IRBorder is a base type.

	IRBorder _topBorder @accessors(property=topBorder);
	IRBorder _rightBorder @accessors(property=rightBorder);
	IRBorder _bottomBorder @accessors(property=bottomBorder);
	IRBorder _leftBorder @accessors(property=leftBorder);
	
//	IRShadow _shadow;

//	Simply setting a backgroundColor makes the view’s background solid.
//	Setting any of the two gradient colors makes the background a gradient.
	
	CPColor gradientStartColor @accessors;
	CPColor gradientEndColor @accessors;
	CPColor backgroundColor @accessors;
	
}





- (void) setTopBorder:(IRBorder)topBorder {		_topBorder = topBorder;		}
- (void) setRightBorder:(IRBorder)rightBorder {		_rightBorder = rightBorder;	}
- (void) setBottomBorder:(IRBorder)bottomBorder {	_bottomBorder = bottomBorder;	}
- (void) setLeftBorder:(IRBorder)leftBorder {		_leftBorder = leftBorder;	}





- (void) drawRect:(CGRect)rect {

	CGContextDrawLinearGradient(
		
		[[CPGraphicsContext currentContext] graphicsPort],
		
		CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [gradientStartColor, gradientEndColor], NULL), 
		
		rect.origin,
		CGPointOffset(rect.origin, rect.size.width, rect.size.height), 
		
		0
		
	);
	
}





@end