//
//  View.m
//  Nov1
//
//  Created by Lisa Jenkins on 11/1/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "View.h"
#import "LittleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"initWithFrame:");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.bounds = CGRectMake(self.bounds.size.width/2, self.bounds.size.height/2, self.bounds.size.width, self.bounds.size.height);
        
        CGRect b = CGRectMake(self.bounds.origin.x, self.bounds.origin.y + self.bounds.size.height/4, self.bounds.size.width, self.bounds.size.height*2/3);
        
        littleView = [[LittleView alloc] initWithFrame:b];
        [self addSubview:littleView];
        
        NSString *zone = @"Eastern Time Zone";
        CGSize size = [zone sizeWithFont:[UIFont boldSystemFontOfSize:20]];
        
        CGRect label = CGRectMake(self.bounds.origin.x + size.width/2, self.bounds.origin.y + size.height/2, size.width, size.height);
        
        timeZoneLabel = [[UILabel alloc] initWithFrame:label];
        timeZoneLabel.text = zone;
        timeZoneLabel.textColor = [UIColor blackColor];
        
        [self addSubview:timeZoneLabel];
        
        //swiping code
        UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(swipe:)];
        
        swipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        
        [self addGestureRecognizer: swipeRecognizer];
        
        //pinching code
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
        
        [self addGestureRecognizer:pinchRecognizer];
        
    }
    return self;
}



//-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  //  if (touches.count>0) {

-(void) swipe: (UISwipeGestureRecognizer *) recognizer{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
    
    [UIView animateWithDuration:1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                         animations: ^{
                             littleView.alpha = 0;
                             timeZoneLabel.alpha = 0;
                             timeZoneLabel.center = CGPointMake(self.bounds.size.width + timeZoneLabel.bounds.size.width, self.bounds.origin.y + timeZoneLabel.bounds.size.height/2);
                             [littleView incrementTZ];
                             
                             
                         } completion:^(BOOL b){
                             [UIView animateWithDuration:1.0
                                                   delay:0.0
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                 littleView.alpha = 1;
                                 timeZoneLabel.alpha = 1;
                                 NSString *zone = @"Eastern Time Zone";
                                 NSInteger TZ = [littleView getTZ];
                                   switch (TZ) {
                                       case 2:
                                         zone = @"Central Time Zone";
                                         break;
                                       case 3:
                                         zone = @"Mountain Time Zone";
                                         break;
                                       case 4:
                                         zone = @"Pacific Time Zone";
                                         break;
                                       case 5:
                                         zone = @"Eastern Time Zone";
                                       default:
                                         zone = @"Eastern Time Zone";
                                         break;
                                    }
                                 timeZoneLabel.text = zone;
                                 timeZoneLabel.center = CGPointMake(self.bounds.origin.x + self.bounds.size.width/2, self.bounds.origin.y + timeZoneLabel.bounds.size.height/2);
                             } completion: NULL
                              
                              ];
                         }
         ];
    }
}

-(void) pinch: (UIPinchGestureRecognizer *) recognizer {
    CGFloat littleWidth = littleView.bounds.size.width;
    CGFloat littleHeight = littleView.bounds.size.height;
    CGFloat newWidth = 1;
    CGFloat newHeight = 1;
    NSLog(@"%f", recognizer.scale);
    if (littleWidth>7 && littleHeight>7) {
        newWidth = littleWidth*recognizer.scale;
        newHeight = littleHeight*recognizer.scale;
    } else {
        newWidth = 10;
        newHeight = 10;
    }
    littleView.bounds = CGRectMake(0,0, newWidth, newHeight);
}


 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
/* - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }*/
 

@end