//
//  CALayer+CALayer_CALayer_borderColor.m
//  Shopping APP 生鮮雜貨
//
//  Created by Rose on 2021/6/3.
//

#import "CALayer+CALayer_CALayer_borderColor.h"
#import <UIKit/UIKit.h>
@implementation CALayer (CALayer_CALayer_borderColor)
- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
@end
