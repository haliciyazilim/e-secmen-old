//
//  SecmenTabBarViewController.m
//  e-Secmen
//
//  Created by Alperen Kavun on 08.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import "SecmenTabBarViewController.h"

#import "SecmenKunyeViewController.h"
#import "SecmenBinaBilgisiViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SecmenTabBarViewController ()

@end

@implementation SecmenTabBarViewController
{
    UIView* infoView;
    BOOL isInfoOpen;
}

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
	// Do any additional setup after loading the view.
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoButton setFrame:CGRectMake(0.0, 0.0, 32.0, 32.0)];
    [infoButton setImage:[UIImage imageNamed:@"title_infobtn_normal.png"] forState:UIControlStateNormal];
    [infoButton setImage:[UIImage imageNamed:@"title_infobtn_highlighted.png"] forState:UIControlStateHighlighted];
    [infoButton setBackgroundColor:[UIColor clearColor]];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* infoBarButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];

    self.navigationItem.rightBarButtonItem = infoBarButton;
    
    isInfoOpen = NO;
}
- (void) showInfo
{
    if (!isInfoOpen) {
        CGSize size = self.view.frame.size;
        UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(30.0, 30.0, size.width-60.0, size.height-60.0-self.tabBar.frame.size.height)];
        [scrollView setBackgroundColor:[UIColor colorWithRed:127.0/255.0 green:65.0/255.0 blue:59.0/255.0 alpha:1.0]];
        scrollView.layer.cornerRadius = 6.0;
        
        CGRect scrollFrame = [scrollView frame];
        UIImage* closeImageN = [UIImage imageNamed:@"close_normal.png"];
        UIImage* closeImageH = [UIImage imageNamed:@"close_highlighted.png"];
        UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeButton setBackgroundColor:[UIColor clearColor]];
        [closeButton setImage:closeImageN forState:UIControlStateNormal];
        [closeButton setImage:closeImageH forState:UIControlStateHighlighted];
        [closeButton setFrame:CGRectMake(scrollFrame.origin.x+scrollFrame.size.width-44.0*0.6, scrollFrame.origin.y+0.0-44.0*0.4, 44.0, 44.0)];
        [closeButton addTarget:self action:@selector(closeInfo) forControlEvents:UIControlEventTouchUpInside];
        [closeButton setContentMode:UIViewContentModeCenter];
        
        NSString* infoString1 = @"CHP Bilgi ve İletişim Teknolojileri Genel Başkan Yardımcılığı'ndan";
        
        NSString* infoString2 = @"KUŞKU YETMEZ, KONTROL ETMEK GEREKİR!";
        
        NSString* infoString3 = @"Yurttaşlarımızın büyük bir bölümü seçimlerin güvenilirliğinden kuşku duyuyor.";
        NSString* infoString4 = @"Seçim süreçlerinin her aşamasında karşılaşılabilecek usulsüzlükler ve hataların belirlenmesi ve düzeltilmesi için CHP olarak çözümler üretiyoruz.";
        NSString* infoString5 = @"Hangi partiye yakın olursa olsun dürüst ve güvenilir bir seçim isteyen tüm yurttaşlarımızı e-seçmen uygulamamızı kullanarak; seçmen listelerini kontrol etmeye ve gördükleri eksiklik, fazlalık ve hataları bağlı oldukları ilçelerin ilçe nüfus müdürlüklerine bildirmeye davet ediyoruz.";
        NSString* infoString6 = @"Bilişim uygulamalarımızın daha çok kişiye ulaşmasında ve yaygınlaşmasında desteklerinizi bekliyoruz. ";
        NSString* infoString7 = @"Hedefimiz; CHP'yi elektronik partiye, Türkiye'yi bilgi toplumuna dönüştürmektir.";
        NSString* infoString8 = @"Sevgi ve saygılarımızla,";
        NSString* infoString9 = @"Emrehan Halıcı";
        NSString* infoString10 = @"Genel Başkan Yardımcısı";
        NSString* infoString11 = @"Bilgi ve İletişim Teknolojileri";
        
        NSString* infoString12 = @"twitter.com/emrehanhalici";
        NSString* infoString13 = @"facebook.com/emrehanhalici";
        
        UIFont* normalFont = [UIFont fontWithName:@"Futura-CondensedMedium" size:16.0];
        UIFont* boldFont = [UIFont fontWithName:@"Futura-Medium" size:18.0];
        UIFont* boldFont2 = [UIFont fontWithName:@"Futura-Medium" size:16.0];
        
        CGSize labelSize1 = [infoString1 sizeWithFont:boldFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize2 = [infoString2 sizeWithFont:boldFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize3 = [infoString3 sizeWithFont:normalFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize4 = [infoString4 sizeWithFont:normalFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize5 = [infoString5 sizeWithFont:normalFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize6 = [infoString6 sizeWithFont:normalFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize7 = [infoString7 sizeWithFont:normalFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize8 = [infoString8 sizeWithFont:normalFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize9 = [infoString9 sizeWithFont:boldFont2 constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize10 = [infoString10 sizeWithFont:boldFont2 constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize11 = [infoString11 sizeWithFont:boldFont2 constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize12 = [infoString12 sizeWithFont:normalFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGSize labelSize13 = [infoString13 sizeWithFont:normalFont constrainedToSize:CGSizeMake(scrollFrame.size.width-20.0, 1000.0)];
        
        CGFloat labelsX = 10.0;
        CGFloat labelsWidth = scrollFrame.size.width-20.0;
        CGFloat labelsMargin = 10.0;
        CGFloat label1Y = 20.0;
        CGFloat label2Y = label1Y+labelSize1.height+labelsMargin;
        CGFloat label3Y = label2Y+labelSize2.height+labelsMargin;
        CGFloat label4Y = label3Y+labelSize3.height+labelsMargin;
        CGFloat label5Y = label4Y+labelSize4.height+labelsMargin;
        CGFloat label6Y = label5Y+labelSize5.height+labelsMargin;
        CGFloat label7Y = label6Y+labelSize6.height+labelsMargin;
        CGFloat label8Y = label7Y+labelSize7.height+labelsMargin;
        CGFloat label9Y = label8Y+labelSize8.height+labelsMargin;
        CGFloat label10Y = label9Y+labelSize9.height;
        CGFloat label11Y = label10Y+labelSize10.height;
        CGFloat label12Y = label11Y+labelSize11.height+labelsMargin;
        CGFloat label13Y = label12Y+labelSize12.height+5.0;

        UILabel* infoLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label1Y, labelsWidth, labelSize1.height)];
        [infoLabel1 setBackgroundColor:[UIColor clearColor]];
        [infoLabel1 setNumberOfLines:0];
        [infoLabel1 setTextColor:[UIColor whiteColor]];
        [infoLabel1 setText:infoString1];
        [infoLabel1 setFont:boldFont];
        UILabel* infoLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label2Y, labelsWidth, labelSize2.height)];
        [infoLabel2 setBackgroundColor:[UIColor clearColor]];
        [infoLabel2 setNumberOfLines:0];
        [infoLabel2 setTextColor:[UIColor whiteColor]];
        [infoLabel2 setText:infoString2];
        [infoLabel2 setFont:boldFont];
        UILabel* infoLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label3Y, labelsWidth, labelSize3.height)];
        [infoLabel3 setBackgroundColor:[UIColor clearColor]];
        [infoLabel3 setNumberOfLines:0];
        [infoLabel3 setTextColor:[UIColor whiteColor]];
        [infoLabel3 setText:infoString3];
        [infoLabel3 setFont:normalFont];
        UILabel* infoLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label4Y, labelsWidth, labelSize4.height)];
        [infoLabel4 setBackgroundColor:[UIColor clearColor]];
        [infoLabel4 setNumberOfLines:0];
        [infoLabel4 setTextColor:[UIColor whiteColor]];
        [infoLabel4 setText:infoString4];
        [infoLabel4 setFont:normalFont];
        UILabel* infoLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label5Y, labelsWidth, labelSize5.height)];
        [infoLabel5 setBackgroundColor:[UIColor clearColor]];
        [infoLabel5 setNumberOfLines:0];
        [infoLabel5 setTextColor:[UIColor whiteColor]];
        [infoLabel5 setText:infoString5];
        [infoLabel5 setFont:normalFont];
        UILabel* infoLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label6Y, labelsWidth, labelSize6.height)];
        [infoLabel6 setBackgroundColor:[UIColor clearColor]];
        [infoLabel6 setNumberOfLines:0];
        [infoLabel6 setTextColor:[UIColor whiteColor]];
        [infoLabel6 setText:infoString6];
        [infoLabel6 setFont:normalFont];
        UILabel* infoLabel7 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label7Y, labelsWidth, labelSize7.height)];
        [infoLabel7 setBackgroundColor:[UIColor clearColor]];
        [infoLabel7 setNumberOfLines:0];
        [infoLabel7 setTextColor:[UIColor whiteColor]];
        [infoLabel7 setText:infoString7];
        [infoLabel7 setFont:normalFont];
        UILabel* infoLabel8 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label8Y, labelsWidth, labelSize8.height)];
        [infoLabel8 setBackgroundColor:[UIColor clearColor]];
        [infoLabel8 setNumberOfLines:0];
        [infoLabel8 setTextColor:[UIColor whiteColor]];
        [infoLabel8 setText:infoString8];
        [infoLabel8 setFont:normalFont];
        UILabel* infoLabel9 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label9Y, labelsWidth, labelSize9.height)];
        [infoLabel9 setBackgroundColor:[UIColor clearColor]];
        [infoLabel9 setNumberOfLines:0];
        [infoLabel9 setTextColor:[UIColor whiteColor]];
        [infoLabel9 setText:infoString9];
        [infoLabel9 setFont:boldFont2];
        UILabel* infoLabel10 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label10Y, labelsWidth, labelSize10.height)];
        [infoLabel10 setBackgroundColor:[UIColor clearColor]];
        [infoLabel10 setNumberOfLines:0];
        [infoLabel10 setTextColor:[UIColor whiteColor]];
        [infoLabel10 setText:infoString10];
        [infoLabel10 setFont:boldFont2];
        UILabel* infoLabel11 = [[UILabel alloc] initWithFrame:CGRectMake(labelsX, label11Y, labelsWidth, labelSize11.height)];
        [infoLabel11 setBackgroundColor:[UIColor clearColor]];
        [infoLabel11 setNumberOfLines:0];
        [infoLabel11 setTextColor:[UIColor whiteColor]];
        [infoLabel11 setText:infoString11];
        [infoLabel11 setFont:boldFont2];
        
        UILabel* infoLabel12 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelsWidth, labelSize12.height)];
        [infoLabel12 setBackgroundColor:[UIColor clearColor]];
        [infoLabel12 setNumberOfLines:0];
        [infoLabel12 setTextColor:[UIColor whiteColor]];
        [infoLabel12 setText:infoString12];
        [infoLabel12 setFont:normalFont];
        
        UIButton* twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [twitterButton setBackgroundColor:[UIColor clearColor]];
        [twitterButton setFrame:CGRectMake(labelsX, label12Y, labelsWidth, labelSize12.height)];
        [twitterButton addSubview:infoLabel12];
        [twitterButton addTarget:self action:@selector(openTwitter) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel* infoLabel13 = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, labelsWidth, labelSize13.height)];
        [infoLabel13 setBackgroundColor:[UIColor clearColor]];
        [infoLabel13 setNumberOfLines:0];
        [infoLabel13 setTextColor:[UIColor whiteColor]];
        [infoLabel13 setText:infoString13];
        [infoLabel13 setFont:normalFont];
        
        UIButton* facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [facebookButton setBackgroundColor:[UIColor clearColor]];
        [facebookButton setFrame:CGRectMake(labelsX, label13Y, labelsWidth, labelSize13.height)];
        [facebookButton addSubview:infoLabel13];
        [facebookButton addTarget:self action:@selector(openFacebook) forControlEvents:UIControlEventTouchUpInside];
        
        [scrollView setShowsHorizontalScrollIndicator:NO];
        [scrollView setScrollEnabled:YES];
        [scrollView setShowsVerticalScrollIndicator:NO];
        [scrollView setContentSize:CGSizeMake(260.0,label13Y+labelSize13.height+labelsMargin)];
        
        [scrollView addSubview:infoLabel1];
        [scrollView addSubview:infoLabel2];
        [scrollView addSubview:infoLabel3];
        [scrollView addSubview:infoLabel4];
        [scrollView addSubview:infoLabel5];
        [scrollView addSubview:infoLabel6];
        [scrollView addSubview:infoLabel7];
        [scrollView addSubview:infoLabel8];
        [scrollView addSubview:infoLabel9];
        [scrollView addSubview:infoLabel10];
        [scrollView addSubview:infoLabel11];
        [scrollView addSubview:twitterButton];
        [scrollView addSubview:facebookButton];
        
        UIView* shadowView = [[UIView alloc] initWithFrame:scrollView.frame];
        [shadowView setBackgroundColor:[UIColor clearColor]];
        [shadowView setClipsToBounds:NO];
        
        [shadowView.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [shadowView.layer setShadowOffset:CGSizeMake(0.0, 0.0)];
        [shadowView.layer setShadowRadius:10.0];
        [shadowView.layer setShadowOpacity:1.0];
        [shadowView.layer setShadowPath:[[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)] CGPath]];
        
        infoView = [[UIView alloc] initWithFrame:self.view.frame];
        [infoView setBackgroundColor:[UIColor clearColor]];
        [infoView addSubview:shadowView];
        [infoView addSubview:scrollView];
        [infoView addSubview:closeButton];

        [self.view addSubview:infoView];
        isInfoOpen = YES;
    } else {
        [self closeInfo];
    }
}
- (void) openFacebook
{
    NSURL *appUrl = [NSURL URLWithString:@"fb://profile/788029844"];
    NSURL *webUrl = [NSURL URLWithString:@"http://www.facebook.com/emrehanhalici"];
    BOOL canOpenFacebookApp = [[UIApplication sharedApplication] canOpenURL:appUrl];
    if (canOpenFacebookApp) {
        [[UIApplication sharedApplication] openURL:appUrl];
    } else {
        [[UIApplication sharedApplication] openURL:webUrl];
    }

}
- (void) openTwitter
{
    NSURL *appUrl = [NSURL URLWithString:@"twitter://user?screen_name=emrehanhalici"];
    NSURL *webUrl = [NSURL URLWithString:@"http://www.twitter.com/emrehanhalici"];
    BOOL canOpenFacebookApp = [[UIApplication sharedApplication] canOpenURL:appUrl];
    if (canOpenFacebookApp) {
        [[UIApplication sharedApplication] openURL:appUrl];
    } else {
        [[UIApplication sharedApplication] openURL:webUrl];
    }
}
- (void) closeInfo
{
    [infoView removeFromSuperview];
    infoView = nil;
    isInfoOpen = NO;
}
- (void)viewWillAppear:(BOOL)animated {
    
    UIImage *titleImage = [UIImage imageNamed:@"title_secmenkunyesi.png"];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    
    self.navigationItem.titleView = titleImageView;
    
    SecmenKunyeViewController *secmenKunyeViewController = [self.viewControllers objectAtIndex:0];
    [secmenKunyeViewController setIsFirst];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setVoter:(Voter *)voter {
    SecmenKunyeViewController *sandikKunyeViewController = [self.viewControllers objectAtIndex:0];
    sandikKunyeViewController.voter = voter;
    
    SecmenBinaBilgisiViewController *sandikBinaBilgisiViewController = [self.viewControllers objectAtIndex:1];
    sandikBinaBilgisiViewController.voter = voter;
}

@end
