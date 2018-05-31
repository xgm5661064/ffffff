//
//  UIColor(Addition).m
//  CaiYun
//
//  Created by penghanbin on 12-12-17.
//
//

#import "UIColor(Addition).h"

@implementation UIColor(Addition)

+ (UIColor *)colorWithHex:(unsigned int)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [self colorWithHexString:hexString andAlpha:1];
}

+ (UIColor*)colorRed:(int)red green:(int)green blue:(int)blue alpha:(int)alpha {
    return [UIColor colorWithRed:(CGFloat)red/255.0 green:(CGFloat)green/255.0 blue:(CGFloat)blue/255.0 alpha:(CGFloat)alpha/255.0];
}
+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha {
    UIColor *col;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        col = [self colorWithHexValue:hexValue andAlpha:alpha];
    } else {
        NSLog(@"ERROR: calling [UIColor colorWithHexString:andAlpha] with an invalid hex string: '%@'", hexString);
        col = [self blackColor];
    }
    return col;
}
+ (UIColor *)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}
@end
