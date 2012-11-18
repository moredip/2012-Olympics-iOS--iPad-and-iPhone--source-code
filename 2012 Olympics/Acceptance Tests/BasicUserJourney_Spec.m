#import "AcceptanceSpecHelper.h"
#import "EventsScreen.h"

SPEC_BEGIN(BasicUserJourney)

describe(@"User Journey", ^{
    
    beforeAll(^{
        sleepFor(0.5);
    });
    
    afterAll(^{
        sleepFor(5);
    });
    
    it(@"visit the event screen, scroll down, view some details about Dressage", ^{
        EventsScreen *eventsScreen = [EventsScreen ensure];
        [[theValue([eventsScreen currentlyOnCorrectTab]) should] beTrue];
        
        [eventsScreen selectEvent:@"beach volleyball"];
        [[theValue([eventsScreen currentlyViewingEventDetailsFor:@"Beach Volleyball"]) should] beTrue];
        
        [eventsScreen goBackToOverview];
        
        [eventsScreen selectEvent:@"canoe sprint"];
        [[theValue([eventsScreen currentlyViewingEventDetailsFor:@"Canoe Sprint"]) should] beTrue];

    });
});


SPEC_END