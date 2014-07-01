#import <XCTest/XCTest.h>
#import "UIView+ASYPresenterSupport.h"

@interface ASYPresenterSupportTest : XCTestCase

@end

@implementation ASYPresenterSupportTest

- (void)testWhenRetainPresenterThenPresentersAreRetained {
    __weak NSObject *weakPresenter1 = nil;
    __weak NSObject *weakPresenter2 = nil;
    UIView *view = [[UIView alloc] init];
    
    @autoreleasepool {
        __strong NSObject *presenter1 = [[NSObject alloc] init];
        __strong NSObject *presenter2 = [[NSObject alloc] init];
        weakPresenter1 = presenter1;
        weakPresenter2 = presenter2;
        [view retainPresenter:presenter1];
        [view retainPresenter:presenter2];
    }
    
    XCTAssertNotNil(weakPresenter1);
    XCTAssertNotNil(weakPresenter2);
}

- (void)testWhenReleasePresentersThenPresentersAreReleased {
    __weak NSObject *weakPresenter1 = nil;
    __weak NSObject *weakPresenter2 = nil;
    UIView *view = [[UIView alloc] init];
    
    @autoreleasepool {
        __strong NSObject *presenter1 = [[NSObject alloc] init];
        __strong NSObject *presenter2 = [[NSObject alloc] init];
        weakPresenter1 = presenter1;
        weakPresenter2 = presenter2;
        [view retainPresenter:presenter1];
        [view retainPresenter:presenter2];
    }
    
    [view releaseAllPresenters];
    
    XCTAssertNil(weakPresenter1);
    XCTAssertNil(weakPresenter2);
}

- (void)testWhenViewIsReleasedThenPresentersAreReleased {
    __weak NSObject *weakPresenter1 = nil;
    __weak NSObject *weakPresenter2 = nil;
    __strong UIView *view = nil;
    
    @autoreleasepool {
        __strong NSObject *presenter1 = [[NSObject alloc] init];
        __strong NSObject *presenter2 = [[NSObject alloc] init];
        view = [[UIView alloc] init];
        weakPresenter1 = presenter1;
        weakPresenter2 = presenter2;
        [view retainPresenter:presenter1];
        [view retainPresenter:presenter2];
    }
    
    view = nil;
    
    XCTAssertNil(weakPresenter1);
    XCTAssertNil(weakPresenter2);
}

@end
