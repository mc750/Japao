//
//  CallOut.h
//  Grafitaki
//
//  Created by Renato Y. Soma on 03/06/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CallOut : NSObject <MKAnnotation>
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) NSString *text;
-(MKAnnotationView*)annotationView;
@end
