//
//  EventsScreen.m
//  2012 Olympics
//
//  Created by Pete Hodgson on 11/18/12.
//
//

#import "EventsScreen.h"

@implementation EventsScreen

- (NSArray *)viewsViaSelector:(NSString *)selector{
    return [[Shelley withSelectorString:selector] selectFrom:[[UIApplication sharedApplication] keyWindow]];
}

- (UIView *)viewViaSelector:(NSString *)selector{
    NSArray *views = [self viewsViaSelector:selector];
    if( [views count] == 0 )
        return nil;
    else
        return [views objectAtIndex:0];
}

- (void) visit{
    [UIAutomationBridge tapView:[self viewViaSelector:@"view:'UITabBarButton' marked:'Events'"]];
    sleepFor(0.1);
}

- (BOOL) currentlyOnCorrectTab{
    return [self viewViaSelector:@"view:'UITabBarButton' marked:'Events' view:'UITabBarSelectionIndicatorView'"] != nil;
}

+ (EventsScreen *) ensure{
    EventsScreen *screen = [[[EventsScreen alloc] init] autorelease];
    [screen visit];
    return screen;
}

- (void) selectEvent:(NSString *)eventName{
    NSString *viewSelector = [NSString stringWithFormat:@"view:'UIScrollView' button marked:'%@'",eventName];
    [UIAutomationBridge tapView:[self viewViaSelector:viewSelector]];
    sleepFor(0.1);
}

- (void) goBackToOverview{
    [UIAutomationBridge tapView:[self viewViaSelector:@"view:'UINavigationButton' marked:'Back'"]];
    sleepFor(0.1);

}

- (BOOL) currentlyViewingEventDetails{
    return [self viewViaSelector:@"label marked:'Key Facts'"] && [self viewViaSelector:@"label marked:'The basics'"];
}

- (BOOL) currentlyViewingEventDetailsFor:(NSString *)eventName{
    return [self currentlyViewingEventDetails] && [self viewViaSelector:[NSString stringWithFormat:@"label marked:'%@'",eventName]];
}

@end
