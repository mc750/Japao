//
//  CallOut.m
//  Grafitaki
//
//  Created by Renato Y. Soma on 03/06/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import "CallOut.h"

@implementation CallOut
-(CLLocationCoordinate2D)coordinate{
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

-(NSString*)title{
    return self.text;
}
-(MKAnnotationView*)annotationView{
    NSString *identifier=@"identifier";
    MKPinAnnotationView *annotationView=[[MKPinAnnotationView alloc]initWithAnnotation:self reuseIdentifier:identifier];
    annotationView.enabled=YES;
    annotationView.canShowCallout=YES;
    annotationView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}
@end
