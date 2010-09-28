//	IRSkinnyScrollView.j
//	Evadne Wu at Iridia, 2010
//	Code grabbed from original CPScrollView implementation

@import <AppKit/CPScrollView.j>
	
	
	
	
	
@implementation IRSkinnyScrollView : CPScrollView





- (void) reflectScrolledClipView:(CPClipView)aClipView {
	
	if(_contentView !== aClipView) return;
	if (_recursionCount > 5) return;
	++_recursionCount;

	var documentView = [self documentView];
	if (!documentView) {

		if (_autohidesScrollers) {

			[_verticalScroller setHidden:YES];
			[_horizontalScroller setHidden:YES];

		}

		[_contentView setFrame:[self bounds]];
		[_headerClipView setFrame:CGRectMakeZero()];

		--_recursionCount;

		return;

	}
	
	
	
	
	
	var	documentFrame = [documentView frame], // the size of the whole document
		contentFrame = [self bounds], // assume it takes up the entire size of the scrollview (no scrollers)
		headerClipViewFrame = [self _headerClipViewFrame],
		headerClipViewHeight = CGRectGetHeight(headerClipViewFrame);
	
	
		contentFrame.origin.y += headerClipViewHeight;
		contentFrame.size.height -= headerClipViewHeight;
	
	
	var	difference = CGSizeMake(
		
			CGRectGetWidth(documentFrame) - CGRectGetWidth(contentFrame), 
			CGRectGetHeight(documentFrame) - CGRectGetHeight(contentFrame)
		
		);
		
	
	var	verticalScrollerWidth = CGRectGetWidth([_verticalScroller frame]),
		horizontalScrollerHeight = CGRectGetHeight([_horizontalScroller frame]),
		hasVerticalScroll = difference.height > 0.0,
		hasHorizontalScroll = difference.width > 0.0,
		shouldShowVerticalScroller = _hasVerticalScroller && (!_autohidesScrollers || hasVerticalScroll),
		shouldShowHorizontalScroller = _hasHorizontalScroller && (!_autohidesScrollers || hasHorizontalScroll);
	
	
	
	
	
	// Now we have to account for the shown scrollers affecting the deltas.
	
	if (shouldShowVerticalScroller) {
	
		difference.width += verticalScrollerWidth;
		hasHorizontalScroll = difference.width > 0.0;
		shouldShowHorizontalScroller = _hasHorizontalScroller && (!_autohidesScrollers || hasHorizontalScroll);
	
	}

	if (shouldShowHorizontalScroller) {

		difference.height += horizontalScrollerHeight;
		hasVerticalScroll = difference.height > 0.0;
		shouldShowVerticalScroller = _hasVerticalScroller && (!_autohidesScrollers || hasVerticalScroll);

	}
	
//	We now definitively know which scrollers are shown or not, as well as whether they are showing scroll values.
	[_verticalScroller setHidden:!shouldShowVerticalScroller];
	[_verticalScroller setEnabled:hasVerticalScroll];

	[_horizontalScroller setHidden:!shouldShowHorizontalScroller];
	[_horizontalScroller setEnabled:hasHorizontalScroll];

//	We can thus appropriately account for them changing the content size.
//	if (shouldShowVerticalScroller) contentFrame.size.width -= verticalScrollerWidth;
//	if (shouldShowHorizontalScroller) contentFrame.size.height -= horizontalScrollerHeight;
		
	var	scrollPoint = [_contentView bounds].origin,
		wasShowingVerticalScroller = ![_verticalScroller isHidden],
		wasShowingHorizontalScroller = ![_horizontalScroller isHidden];

	if (shouldShowVerticalScroller) {

		var 	verticalScrollerY = MAX( CGRectGetHeight([self _cornerViewFrame]), headerClipViewHeight ),
			verticalScrollerHeight = CGRectGetHeight([self bounds]) - verticalScrollerY;

		if (shouldShowHorizontalScroller)
		verticalScrollerHeight -= horizontalScrollerHeight;

		[_verticalScroller setFloatValue:(difference.height <= 0.0) ? 0.0 : scrollPoint.y / difference.height];
		[_verticalScroller setKnobProportion:CGRectGetHeight(contentFrame) / CGRectGetHeight(documentFrame)];
		[_verticalScroller setFrame:CGRectMake(
			
			CGRectGetMaxX(contentFrame) - verticalScrollerWidth, verticalScrollerY, 
			verticalScrollerWidth, verticalScrollerHeight
			
		)];
		
	} else if (wasShowingVerticalScroller) {

		[_verticalScroller setFloatValue:0.0];
		[_verticalScroller setKnobProportion:1.0];

	}
	
	
	
	
	
	if (shouldShowHorizontalScroller) {

		[_horizontalScroller setFloatValue:(difference.width <= 0.0) ? 0.0 : scrollPoint.x / difference.width];
		[_horizontalScroller setKnobProportion:CGRectGetWidth(contentFrame) / CGRectGetWidth(documentFrame)];
		[_horizontalScroller setFrame:CGRectMake(
			
			0.0, CGRectGetMaxY(contentFrame) - horizontalScrollerHeight, 
			CGRectGetWidth(contentFrame), horizontalScrollerHeight
			
		)];
		
	} else if (wasShowingHorizontalScroller) {

		[_horizontalScroller setFloatValue:0.0];
		[_horizontalScroller setKnobProportion:1.0];
	
	}
	
	[_contentView setFrame:contentFrame];
	[_headerClipView setFrame:headerClipViewFrame];
	[_cornerView setFrame:[self _cornerViewFrame]];
	
	--_recursionCount;

}





- (void)setHasHorizontalScroller:(BOOL)shouldHaveHorizontalScroller {

	if (_hasHorizontalScroller === shouldHaveHorizontalScroller)
	return;

	_hasHorizontalScroller = shouldHaveHorizontalScroller;

	if (_hasHorizontalScroller && !_horizontalScroller) {

		[self setHorizontalScroller:[[IRSkinnyScroller alloc] initWithFrame:CGRectMake(
			
			0.0, 
			0.0, 
			MAX(CGRectGetWidth([self bounds]), [IRSkinnyScroller scrollerWidth]+1), 
			[IRSkinnyScroller scrollerWidth]
			
		)]];
		
		[[self horizontalScroller] setFrameSize:CGSizeMake(
			
			CGRectGetWidth([self bounds]), 
			[IRSkinnyScroller scrollerWidth]
			
		)];

	}

	[self reflectScrolledClipView:_contentView];
}





- (void)setHasVerticalScroller:(BOOL)shouldHaveVerticalScroller
{
	if (_hasVerticalScroller === shouldHaveVerticalScroller)
		return;

	_hasVerticalScroller = shouldHaveVerticalScroller;

	if (_hasVerticalScroller && !_verticalScroller) {

		[self setVerticalScroller:[[IRSkinnyScroller alloc] initWithFrame:CGRectMake(
			
			0.0, 
			0.0, 
			[IRSkinnyScroller scrollerWidth], 
			MAX(CGRectGetHeight([self bounds]), [IRSkinnyScroller scrollerWidth]+1)
			
		)]];
		
		[[self verticalScroller] setFrameSize:CGSizeMake(
			
			[IRSkinnyScroller scrollerWidth], 
			CGRectGetHeight([self bounds])
			
		)];

	}

	[self reflectScrolledClipView:_contentView];

}





@end




