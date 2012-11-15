//
//  LittleView.h
//  Nov1
//
//  Created by Lisa Jenkins on 11/13/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LittleView : UIView{
    NSInteger TZ;
};

-(NSInteger) getTZ;
-(void) incrementTZ;
-(void) scaleAndTranslate: (CGContextRef) c AndScale: (CGFloat) scale YTrans: (CGFloat) y XTrans: (CGFloat) x;
-(void) drawTimeZone: (CGContextRef) c withMapPoints: (CLLocationCoordinate2D *) coord ofSize: (size_t) size forScale: (CGFloat) scale;

@end
