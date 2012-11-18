//
//  EventsScreen.m
//  2012 Olympics
//
//  Created by Pete Hodgson on 11/18/12.
//
//

#import "EventsScreen.h"

@interface EventsScreen()
- (NSArray *)viewsViaSelector:(NSString *)selector;
- (UIView *)viewViaSelector:(NSString *)selector;
- (void) tapViewViaSelector:(NSString *)selector;
@end

@implementation EventsScreen

+ (EventsScreen *) screen{
    EventsScreen *screen = [[[EventsScreen alloc] init] autorelease];
    [screen visit];
    return screen;
}

- (void) visit{
    [self tapViewViaSelector:@"view:'UITabBarButton' marked:'Events'"];
}

- (BOOL) currentlyOnCorrectTab{
    return [self viewViaSelector:@"view:'UITabBarButton' marked:'Events' view:'UITabBarSelectionIndicatorView'"] != nil;
}

- (void) selectEvent:(NSString *)eventName{
    NSString *viewSelector = [NSString stringWithFormat:@"view:'UIScrollView' button marked:'%@'",eventName];
    [self tapViewViaSelector:viewSelector];
}

- (void) goBackToOverview{
    [self tapViewViaSelector:@"view:'UINavigationButton' marked:'Back'"];
}

- (BOOL) currentlyViewingEventDetails{
    return [self viewViaSelector:@"label marked:'Key Facts'"] && [self viewViaSelector:@"label marked:'The basics'"];
}

- (BOOL) currentlyViewingEventDetailsFor:(NSString *)eventName{
    return [self currentlyViewingEventDetails] && [self viewViaSelector:[NSString stringWithFormat:@"label marked:'%@'",eventName]];
}


#pragma mark internals


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

- (void) tapViewViaSelector:(NSString *)viewSelector{
    [UIAutomationBridge tapView:[self viewViaSelector:viewSelector]];
    sleepFor(0.1); //ugh
}

@end
