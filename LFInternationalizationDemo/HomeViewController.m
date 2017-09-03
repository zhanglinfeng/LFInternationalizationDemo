//
//  HomeViewController.m
//  LFInternationalizationDemo
//
//  Created by 张林峰 on 2017/9/3.
//  Copyright © 2017年 张林峰. All rights reserved.
//

#import "HomeViewController.h"
#import "MainTabBarController.h"
#import "NSBundle+LF.h"

@interface HomeViewController ()
    
@property (weak, nonatomic) IBOutlet UILabel *lbAccount;
@property (strong, nonatomic) IBOutlet UITextField *tfAccount;
@property (strong, nonatomic) IBOutlet UIButton *btLogin;
@property (strong, nonatomic) IBOutlet UIImageView *ivIcon;
@property (strong, nonatomic) IBOutlet UIButton *btAuto;
@property (strong, nonatomic) IBOutlet UIButton *btChiness;
@property (strong, nonatomic) IBOutlet UIButton *btEnglish;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //注释掉，改用category快速国际化试试
//    self.lbAccount.text = NSLocalizedString(@"账号", nil);
//    [self.btLogin setTitle:NSLocalizedString(@"登录", nil) forState:UIControlStateNormal];
//    self.ivIcon.image = [UIImage imageNamed:NSLocalizedString(@"图标", nil)];
    
    self.lbAccount.text = @"账号";
    self.ivIcon.image = [UIImage imageNamed:@"图标"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//自动跟随系统
- (IBAction)autoLanguage:(id)sender {
    //获取手机语言
    NSString *phoneLanguage  = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
    [self changeLanguage:phoneLanguage];
}
- (IBAction)chiness:(id)sender {
    [self changeLanguage:@"zh-Hans"];
}
- (IBAction)english:(id)sender {
    [self changeLanguage:@"en"];
}
    
- (void)changeLanguage:(NSString *)language {
    //设置本app语言,注意key一定是@"AppleLanguages"，即使下次启动APP，也是现在设置的这个语言。
    [[NSUserDefaults standardUserDefaults] setObject:@[language] forKey:@"AppleLanguages"];
    
    [NSBundle setMainBundelLanguage:language];
    
    //如果你的storyboard生成的多个语言的.storyboard文件，则获取当前storyboard的bundel如下
    //NSBundle * currentMainBundel = [NSBundle getCurrentMainBundel];
    
    //如果你的storyboard 生成的多个语言的Main.strings文件，则获取当前storyboard的bundel如下
    NSBundle * currentMainBundel = [NSBundle mainBundle];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:currentMainBundel];
    MainTabBarController *tabbar = [storyboard instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabbar;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
