// SLTicker.m
//
// Copyright (c) 2014 Antti Laitala (https://github.com/anlaital)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIApplication.h>

#import "SLTicker.h"
#import "SLFunctions.h"

@interface SLTickerProxy : NSObject

@property (nonatomic, weak) id<SLTickerProxyDelegate> delegate;
@property (nonatomic) NSTimeInterval tickInterval;

- (void)queueTick;

@end

@implementation SLTickerProxy

- (void)queueTick
{
    [self performSelector:@selector(__performTick) withObject:nil afterDelay:self.tickInterval inModes:@[NSRunLoopCommonModes]];
}

- (void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)__performTick
{
    if (_delegate) {
        [_delegate performTick];
        [self queueTick];
    }
}

@end

@implementation SLTicker
{
    time_t _backgroundTime;
    SLTickerProxy *_proxy;
}

- (id)init
{
    if (self = [super init]) {
        _backgroundTime = -1;
        _tickInterval = 1.0;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveApplicationWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveApplicationDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setTicking:(BOOL)ticking
{
    if (_ticking == ticking) return;
    _ticking = ticking;
    if (_ticking) {
        [self __createProxy];
        [_proxy queueTick];
    } else {
        [self __deleteProxy];
    }
}

#pragma mark - SLTickerProxyDelegate

- (void)performTick
{
    [_delegate ticker:self didTick:1];
}

#pragma mark - NSNotificationCenter

- (void)didReceiveApplicationWillResignActiveNotification:(NSNotification *)note
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];

    if (!self.isTicking)
        return;
    
    _backgroundTime = [SLFunctions uptime];

    [self __deleteProxy];
}

- (void)didReceiveApplicationDidBecomeActiveNotification:(NSNotification *)note
{
    if (!self.isTicking)
        return;
    if (_backgroundTime < 0)
        return;
    
    time_t current = [SLFunctions uptime];
    time_t delta = current - _backgroundTime;
    
    [self __createProxy];
    [_proxy queueTick];

    [_delegate ticker:self didTick:((CGFloat)delta / self.tickInterval)];
}

#pragma mark - Private

- (void)__createProxy
{
    _proxy = [SLTickerProxy new];
    _proxy.delegate = self;
    _proxy.tickInterval = _tickInterval;
}

- (void)__deleteProxy
{
    _proxy.delegate = nil;
    _proxy = nil;
}

@end
