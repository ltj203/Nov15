//
//  Nov1AppDelegate.h
//  Nov1
//
//  Created by Lisa Jenkins on 11/1/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Nov1AppDelegate : UIResponder <UIApplicationDelegate>{
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
