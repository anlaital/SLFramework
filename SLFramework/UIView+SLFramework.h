// UIView+SLFramework.h
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

#import <UIKit/UIKit.h>

@interface UIView (SLFramework)

/**
 Shorthand for `view.frame.origin.x`.
 
 @return The x origin of the view's frame.
 */
- (CGFloat)x;

/**
 Shorthand for `view.frame.origin.y`.
 
 @return The y origin of the view's frame.
 */
- (CGFloat)y;

/**
 Shorthand for `view.frame.size.width`.
 
 @return The width of the view's frame.
 */
- (CGFloat)width;

/**
 Shorthand for `view.frame.size.height`.
 
 @return The height of the view's frame.
 */
- (CGFloat)height;

/**
 Shorthand for `view.frame.origin.x = x`.
 
 @param x The x origin to set.
 */
- (void)setX:(CGFloat)x;

/**
 Shorthand for `view.frame.origin.y = y`.

 @param x The y origin to set.
 */
- (void)setY:(CGFloat)y;

/**
 Shorthand for `view.frame.size.width = width`.

 @param x The width to set.
 */
- (void)setWidth:(CGFloat)width;

/**
 Shorthand for `view.frame.size.height = height`.
 
 @param x The height to set.
 */
- (void)setHeight:(CGFloat)height;

@end
