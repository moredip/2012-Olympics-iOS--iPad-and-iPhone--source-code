//
//  EventsScreen.h
//  2012 Olympics
//
//  Created by Pete Hodgson on 11/18/12.
//
//

#import <Foundation/Foundation.h>
#import "ScreensHelper.h"

@interface EventsScreen : NSObject
+ (EventsScreen *) ensure;
- (BOOL) currentlyOnCorrectTab;
- (void) visit;
- (void) selectEvent:(NSString *)eventName;
- (BOOL) currentlyViewingEventDetailsFor:(NSString *)eventName;
- (void) goBackToOverview;
@end
