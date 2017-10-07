//
//  ViewController.m
//  hw002-MDCCampuses
//
//  Created by user130164 on 10/7/17.
//  Copyright © 2017 paulc. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()
{
    UIImage * imgCampus;
    NSURL * urlSource;
    NSString * textData;
    NSArray * campusName;
    int campus;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imgPicBox;
@property (weak, nonatomic) IBOutlet UILabel *lblCampus;
@property (weak, nonatomic) IBOutlet UILabel *lblCampusText;
@property (weak, nonatomic) IBOutlet UIButton *btnPrevious;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    campus = 0;
    campusName = @[@"Hialeah",@"Homestead",@"InterAmerican",@"Kendall",@"Medical",@"North",@"Entrepreneurial Education Center",@"West",@"Wolfson"];
    [self selectCampus];
    [self updateCampus];
    [self updateButtonState];
    _imgPicBox.layer.cornerRadius = 10;
    _imgPicBox.clipsToBounds = YES;
    _imgPicBox.layer.borderWidth = 0.2;
    _imgPicBox.layer.borderColor = [UIColor blackColor].CGColor;
    _lblCampus.layer.cornerRadius = 10;
    _lblCampus.clipsToBounds = YES;
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateCampus
{
    imgCampus = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:urlSource] ];

    [_imgPicBox setImage:imgCampus];
    _lblCampus.text = [campusName objectAtIndex:campus];
    _lblCampusText.text = textData;
}
-(void)selectCampus
{
    switch (campus)
    {
        case 0:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/hialeah.jpg"];
            textData = @"The Hialeah Campus serves the Greater Hialeah-Miami Lakes area, offering day and evening classes six days a week. It is located at 1780 W 49th Street in Hialeah, Florida";
            break;
        case 1:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/homestead.jpg"];
            textData = @"The Homestead Campus is located in the historic downtown district of the City of Homestead with the mission to deliver a full range of higher education programs for the Homestead/ Florida City communities. It is located at 500 College Terrace in Homestead, Florida";
            break;
        case 2:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/iac.jpg"];
            textData = @"The InterAmerican Campus (IAC) is conveniently located in the heart of Little Havana near the Brickell Financial District, Coconut Grove, Coral Gables, Westchester, and Miami International Airport at 627 SW 27th Ave., in Miami Florida.";
            break;
        case 3:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/kendall.jpg"];
            textData = @"The Kendall Campus is situated on a 185-acre tract of trees and lakes and features 13 buildings equipped with the latest technologies, a wellness center, athletic fields and an Olympic-sized pool. It is located at 11011 SW 104th Street in Miami, Florida";
            break;
        case 4:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/medical.jpg"];
            textData = @"The Medical Campus is on 4.3 acres within the city’s medical/civic center complex and is located at 950 NW 20th Street in Miami, Florida";
            break;
        case 5:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/north.jpg"];
            textData = @"The North Campus is on 245 acres in northern Miami-Dade County on land that once hosted a World War II Naval air station. It is located at 11380 NW 27th Avenue in Miami, Florida";
            break;
        case 6:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/meec.jpg"];
            textData = @"The Carrie P. Meek Entrepreneurial Education Center (MEEC) is a major outreach center of Miami Dade College and is located at 6300 NW Seventh Avenue in Miami, Florida";
            break;
        case 7:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/west-campus.jpg"];
            textData = @"The West Campus was approved by the Florida State Board of Education in 2005 and became a designed branch campus of Miami Dade College in July 2017. It is located at 3800 NW 115th Avenue in Doral, Florida";
            break;
        default:
            urlSource = [NSURL URLWithString:@"http://www.mdc.edu/about/img/wolfson.jpg"];
            textData = @"The Wolfson Campus opened in 1970 by holding classes in the storefronts of downtown Miami and opened its first permanent facility in 1973. It is located at 300 NE Second Avenue in Miami, Florida";
            break;
    }
    }
- (IBAction)btnPrevPressed:(id)sender {
    campus -= 1;
    [self selectCampus];
    [self updateCampus];
    [self updateButtonState];
}
- (IBAction)btnNextPressed:(id)sender {
    campus += 1;
    [self selectCampus];
    [self updateCampus];
    [self updateButtonState];
}
-(void)updateButtonState
{
    self.btnPrevious.enabled = YES;
    self.btnPrevious.backgroundColor = [UIColor darkGrayColor];
    self.btnNext.enabled = YES;
    self.btnNext.backgroundColor = [UIColor darkGrayColor];
    if (campus==0)
    {
        self.btnPrevious.enabled = NO;
        self.btnPrevious.backgroundColor = [UIColor colorWithRed: 2.0 green: 68.0 blue: 113.0 alpha:0];
        
    }
    else if (campus == 8)
    {
        self.btnNext.enabled = NO;
        self.btnNext.backgroundColor = [UIColor whiteColor];
    }
}

@end
