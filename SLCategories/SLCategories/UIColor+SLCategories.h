//
//  UIColor+SLCategories.h
//  SLCategories
//
//  Created by Antti Laitala on 02/03/14.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SLColorFormat) {
    SLColorFormatRGB8,
    SLColorFormatRGBA8
};

@interface UIColor (SLCategories)

+ (UIColor *)colorFromHex:(NSString *)hex;
+ (UIColor *)colorFromHex:(NSString *)hex format:(SLColorFormat)format;

- (NSString *)hexStringWithFormat:(SLColorFormat)format prependHash:(BOOL)prependHash;

@end
