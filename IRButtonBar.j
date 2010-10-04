//	IRButtonBar
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRButtonBar : CPView {
	
	CPMutableArray rightButtons;
	CPMutableArray leftButtons;
	
	BOOL patterned;
	
	id delegate @accessors;
	
}





- (void) setPatterned:(BOOL)flag {
	
	patterned = flag;
	
	if (flag) {
		
		[self setBackgroundPatternImageNamed:@"IRActionSheet.backdrop.stripes"]
	
	} else {
		
		[self setBackgroundColor:[CPColor clearColor]];
		
	}
	
}





- (BOOL) patterned {
	
	return patterned;
	
}

- (void) removeRightButtons {
	
	if (!rightButtons) return;
	
	var enumerator = [rightButtons objectEnumerator], object = nil;
	while (object = [enumerator nextObject]) {

		[rightButtons removeObject:object];
		[object removeFromSuperview];
	
	}
	
	[self setNeedsLayout];
	
}

- (void) addRightButton:(CPView)aButton {
	
	if (!rightButtons)
	rightButtons = [CPMutableArray array];
	
	[rightButtons addObject:aButton];
	[self addSubview:aButton];
	
	[self setNeedsLayout];
	
}

- (void) removeLeftButtons {
	
	if (!leftButtons) return;
	
	var enumerator = [leftButtons objectEnumerator], object = nil;
	while (object = [enumerator nextObject]) {

		[leftButtons removeObject:object];
		[object removeFromSuperview];
	
	}
	
	[self setNeedsLayout];
	
}

- (void) addLeftButton:(CPView)aButton {
	
	if (!leftButtons)
	leftButtons = [CPMutableArray array];
	
	[leftButtons addObject:aButton];
	[self addSubview:aButton];
	[self setNeedsLayout];
	
}





- (void) layoutSubviews {
	
	var subviews = [self subviews];
	var enumerator = [subviews objectEnumerator], object = nil;
	
	while (object = [enumerator nextObject])
	if ([object isKindOfClass:[IRTactileButton class]])
	[object centerVerticallyInSuperview];
	
	
	var padding = 16;

	if ([leftButtons count] != 0) {
		
		var enumerator = [leftButtons objectEnumerator], object = nil, leftOffset = 0;
		
		while (object = [enumerator nextObject]) {
			
			if (![object isKindOfClass:[IRTactileButton class]] || [object isHidden]) 
			continue;
			
			[object setFrameOrigin:CGPointMake(leftOffset + padding, 0)];
			
			[object centerVerticallyInSuperview];
			
			leftOffset += CGRectGetWidth([object frame]) + padding;

		}
		
	}
	
	if ([rightButtons count] != 0) {
		
		var	enumerator = [rightButtons objectEnumerator], object = nil, rightOffset = 0,
			availableWidth = CGRectGetWidth([self frame]);
		
		while (object = [enumerator nextObject]) {
			
			if (![object isKindOfClass:[IRTactileButton class]] || [object isHidden])
			continue;

			var objectWidth = CGRectGetWidth([object frame]);
			
			[object setFrameOrigin:CGPointMake(
				
				availableWidth - rightOffset - objectWidth - padding, 
				0
				
			)];
			
			[object centerVerticallyInSuperview];
			
			rightOffset += objectWidth + padding;

		}
		
	}
	
}





- (void) handleButtonClick:(id)sender {
	
	if ([[self delegate] respondsToSelector:@selector(buttonBar:didReceiveActionFromButton:)])
	[[self delegate] buttonBar:self didReceiveActionFromButton:sender];
	
}





@end