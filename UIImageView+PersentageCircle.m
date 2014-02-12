//
//  UIImageView+PersentageCircle.m
//  SBF See
//
//  Created by Ralph Schön on 09.02.14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "UIImageView+PersentageCircle.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (PersentageCircle)

- (UIImageView *)applyCircleWithPersentage:(int)persent andTintColor:(UIColor *)color; {
    
    // begins image context with the size of the imageView and the scale of the actual device (retina, non retina)
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [[UIScreen mainScreen] scale]);
    // creates a graphics context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // sets the distance of the circle to the cell frame in pixels
    CGFloat arcPadding = 8;
    // creates the radius of the circle
    CGFloat arcRadius = (self.frame.size.width / 2) - arcPadding;
    // sets the center of the circle
    CGPoint arcCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    // the first cicle is always displayed 100% and gets overdrawn by the second circle with the real percentage!
    // sets the degree for the first circle
    CGFloat startAngle = radians(0);
    CGFloat endAngle = radians(360);
    
    // creates the path of the first circle in counter clockwise (the last value is "0")
    CGContextAddArc(context, arcCenter.x, arcCenter.y, arcRadius, startAngle, endAngle, 0);
    // sets the linewidth of the first circle
    CGContextSetLineWidth(context, 6.0f);
    
    // gets the RGBA-values of the color
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    // sets the RGB-values and lowers the Alpha-value to make the first circle lighter
    [[UIColor colorWithRed:red green:green blue:blue alpha:0.3f] setStroke];
    // draws the first circle
    CGContextStrokePath(context);
    
    // Same here for the second circle!
    // we use the 270° to start at the top to draw the circle
    startAngle = radians(270);
    // sets the persentage value in degrees
    endAngle = radians(270 - (360 * persent) / 100);
    
    // adds the circle path in clockwise direction (the last value is "1")
    CGContextAddArc(context, arcCenter.x, arcCenter.y, arcRadius, startAngle, endAngle, 1);
    // sets the linewidth for the second circle
    CGContextSetLineWidth(context, 6.0f);
    // sets the full color for the second circle
    [color setStroke];
    // draws the second one
    CGContextStrokePath(context);
    
    // defines the text in the middle of the circle
    NSString *text = [NSString stringWithFormat:@"%i%%", persent];
    NSMutableDictionary *atts = [[NSMutableDictionary alloc] init];
    UIFont *font = [UIFont systemFontOfSize:14];
    // to center the text vertical
    NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter];
    [atts setObject:color forKey:NSForegroundColorAttributeName];
    [atts setObject:font forKey:NSFontAttributeName];
    [atts setObject:style forKey:NSParagraphStyleAttributeName];
    // sets the text and centers it in horizontal direction
    // the "-1" fixed the text for me to get it really in the middle, but maybe you have to remove it
    [text drawInRect:CGRectMake(self.frame.origin.x, self.frame.origin.y + ((self.frame.size.height - font.pointSize) / 2) - 1, self.frame.size.height, font.pointSize) withAttributes:atts];
    
    // creates the image
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    // ends the graphics context
    UIGraphicsEndImageContext();
    // sets the image for the imageView
    [self setImage:retImage];
    // and returns the imageView
    return self;
}

@end
