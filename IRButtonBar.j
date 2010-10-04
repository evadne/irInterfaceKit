//	IRButtonBar
	
	
	
	
	
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
	
	var enumerator = [rightButtons objectEnumerator];
	var object;
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
	
	if ([aButton target] == nil) [aButton setTarget:self];
	if ([aButton action] == nil) [aButton setAction:@selector(handleButtonClick:)];
	
	[self setNeedsLayout];
	
}

- (void) removeLeftButtons {
	
	if (!leftButtons) return;
	
	var enumerator = [leftButtons objectEnumerator];
	var object;
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
	
	if ([aButton target] == nil) [aButton setTarget:self];
	if ([aButton action] == nil) [aButton setAction:@selector(handleButtonClick:)];
	
	[self setNeedsLayout];
	
}





- (void) layoutSubviews {
	
	CPLog(@"LAYOUT!");
	
	var subviews = [self subviews];
	
	CPLog(@"subviews: %@", subviews);
	
	var enumerator = [subviews objectEnumerator];
	var object;
	while (object = [enumerator nextObject])
	if ([object isKindOfClass:[IRTactileButton class]])
	[object centerVerticallyInSuperview];
		
	var padding = 16;

	if ([leftButtons count] != 0) {
		
		var enumerator = [leftButtons objectEnumerator];
		var object;
		
		var leftOffset = 0;
		
		while (object = [enumerator nextObject]) {
			
			if (![object isKindOfClass:[IRTactileButton class]]) continue;

			CPLog(@"object class is %@", [object class]);
			
			[object setAlphaValue:0.2];
			
			CPLog(@"object is %@, hidden? %@", object, [object isHidden]);
		
			if ([object isHidden]) continue;
			
			[object setAlphaValue:1];		
			
			[object setFrameOrigin:CGPointMake(leftOffset + padding, 0)];
			[object centerVerticallyInSuperview];
			
			leftOffset += CGRectGetWidth([object frame]) + padding;

		}
		
	}
	
	if ([rightButtons count] != 0) {
		
		var enumerator = [rightButtons objectEnumerator];
		var object;
		
		var rightOffset = 0;
		var availableWidth = CGRectGetWidth([self frame]);
		
		while (object = [enumerator nextObject]) {
			
			if (![object isKindOfClass:[IRTactileButton class]]) continue;
			
			CPLog(@"object class is %@", [object class]);
			
			[object setAlphaValue:0.2];
			
			CPLog(@"object is %@, hidden? %@", object, [object isHidden]);
				
			if ([object isHidden]) continue;
			
			[object setAlphaValue:1];
			
			var objectWidth = CGRectGetWidth([object frame]);
			
			[object setFrameOrigin:CGPointMake(availableWidth - rightOffset - objectWidth - padding, 0)];
			[object centerVerticallyInSuperview];
			
			rightOffset += objectWidth + padding;

		}
		
	}
	
}





- (void) handleButtonClick:(id)sender {
	
	if ([[self delegate] respondsToSelector:@selector(buttonBar:didReceiveActionFromButton:)])
	[[self delegate] buttonBar:self didReceiveActionFromButton:sender];
	
}





//- (void) enqueueStepViewOfClass:(Class)inViewClass successHandler:(Function)inHandler





@end