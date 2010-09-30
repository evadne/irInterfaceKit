//	IRSelectableToolbarItem.j
//	Evadne Wu at Iridia, 2010
	
	
	
	
	
@implementation IRSelectableToolbarItem : CPToolbarItem {
	
	BOOL selected;
	CPView selectedBackdropView;
	
}

- (IRSelectedToolbarItem) initWithItemIdentifier:(CPString)anItemIdentifier {
	
	self = [super initWithItemIdentifier:anItemIdentifier];
	if (self === nil) return nil;
	
	selectedBackdropView = [[CPView alloc] init];

//	CPImage imageNamed:@"" fromBundleResourcesOf:(id)sender {
	
	
//	[CPBundle bundleForClass:[self class]] resource
	
	return self;
	
}

- (BOOL) isSelected {
	
	return selected;
	
}

- (void) setSelected:(BOOL)inSelectedFlag {
	
	selected = inSelectedFlag;
	[selectedBackdropView setHidden:!selected];
	
}

@end