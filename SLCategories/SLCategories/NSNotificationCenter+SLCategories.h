//
//  NSNotificationCenter+SLCategories.h
//  SLCategories
//
//  Created by Antti Laitala on 03/03/14.
//
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (SLCategories)

- (BOOL)safelyRemoveObserver:(id)observer;
- (BOOL)safelyRemoveObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;
- (BOOL)safelyRemoveObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context;
- (BOOL)safelyRemoveObserver:(id)observer name:(NSString *)aName object:(id)anObject;

@end
