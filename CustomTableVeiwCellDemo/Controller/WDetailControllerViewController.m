//
//  WDetailControllerViewController.m
//  CustomTableVeiwCellDemo
//
//  Created by johnny on 14-9-21.
//  Copyright (c) 2014年 wzrong. All rights reserved.
//

#import "WDetailControllerViewController.h"

@interface WDetailControllerViewController (){

}

@end

@implementation WDetailControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headerview.imageURL = [NSURL URLWithString:self.projectModel.image];
    self.discriptionview.text = [NSString stringWithFormat:@"%@", self.projectModel.description];
    self.titleview.text = [NSString stringWithFormat:@"%@", self.projectModel.title];
    
    NSLog(@"paper year -> %@ ", self.projectModel.title);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}
@end
