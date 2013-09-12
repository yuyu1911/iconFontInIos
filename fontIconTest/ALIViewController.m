//
//  ALIViewController.m
//  fontIconTest
//
//  Created by 俞雨 on 13-9-10.
//  Copyright (c) 2013年 俞雨. All rights reserved.
//

#import "ALIViewController.h"

@interface ALIViewController ()

@end

@implementation ALIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }
    CGRect frame = CGRectMake(0, 0, 400, 44);
    UILabel *title = [[UILabel alloc] initWithFrame:frame];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont fontWithName:@"Kaushan Script" size:35];
    title.textAlignment = NSTextAlignmentCenter;
    //title.textColor = [UIColor whiteColor];
    title.text = self.navigationItem.title;
    self.navigationItem.titleView = title;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, 44, 44);
    [btn1 setTitle:@"\U00000165" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont fontWithName:@"Untitled1" size:30];
    [btn1 setTitleColor:UIColorFromRGB(0x006dff) forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:[[UIBarButtonItem alloc] initWithCustomView:btn1], nil];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 44, 44);
    [btn2 setTitle:@"\U0000E00B" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont fontWithName:@"Untitled1" size:30];
    [btn2 setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:[[UIBarButtonItem alloc] initWithCustomView:btn2], nil];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 300, 50)];
    label.font = [UIFont fontWithName:@"fontello" size:35];
    label.text = @"\U0000E802 \U0000E801 \U0000E803 \U0000E804 \U0000E805 \U0000E81A";
    label.textColor = UIColorFromRGB(0xFF7300);
    [self.view addSubview:label];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 300, 50)];
    label1.font = [UIFont fontWithName:@"FontAwesome" size:35];
    label1.text = @"\U0000F18A \U0000F099 \U0000F179 \U0000F17A";
    label1.textColor = [self getRandomColor];
    [self.view addSubview:label1];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, 300, 50)];
    label2.font = [UIFont fontWithName:@"Untitled1" size:35];
    label2.text = @"\U00000165 \U0000E00B \U0000020C \U0000020D \U000001E4 \U0000F01E";
    label2.textColor = [self getRandomColor];
    [self.view addSubview:label2];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, 300, 50)];
    label3.font = [UIFont fontWithName:@"FontAwesome" size:35];
    label3.text = @"\U0000F113 \U0000F17B \U0000F17C \U0000F166";
    label3.textColor = [self getRandomColor];
    [self.view addSubview:label3];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 260, 300, 150)];
    label4.font = [UIFont fontWithName:@"Untitled1" size:125];
    label4.text = @"\U000001B8";
    label4.textColor = UIColorFromRGB(0xFF7300);
    label4.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label4];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 430, 150, 50);
    btn.titleLabel.font = [UIFont fontWithName:@"Untitled1" size:35];
    //btn.titleLabel = @"\U00000188 下载";
    [btn setTitle:@"\U00000188 下载" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
}
-(UIColor *)getRandomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}
-(NSString *) utf8ToUnicode:(NSString *)string
{
    NSUInteger length = [string length];
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++) {
        unichar _char = [string characterAtIndex:i];
        //判断是否为英文和数字
        if (_char <= '9' && _char >= '0') {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
        }else if(_char >= 'a' && _char <= 'z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
        }else if(_char >= 'A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
        }else
        {
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
        }
        
    }
    return s;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
