#import "AcceptanceSpecHelper.h"
#import "EventsScreen.h"

SPEC_BEGIN(BasicUserJourney)

describe(@"User Journey", ^{
    
    beforeAll(^{
        sleepFor(0.5);
    });

    
    it(@"visits the event screen and views details on a couple of events", ^{
        EventsScreen *eventsScreen = [EventsScreen screen];
        [[theValue([eventsScreen currentlyOnCorrectTab]) should] beTrue];
        
        [eventsScreen selectEvent:@"beach volleyball"];
        [[theValue([eventsScreen currentlyViewingEventDetailsFor:@"Beach Volleyball"]) should] beTrue];
        
        [eventsScreen goBackToOverview];
        
        [eventsScreen selectEvent:@"canoe sprint"];
        [[theValue([eventsScreen currentlyViewingEventDetailsFor:@"Canoe Sprint"]) should] beTrue];

    });
});


SPEC_END