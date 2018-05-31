//
//  GMHomeVC.m
//  StockSystem
//
//  Created by 小熊 on 2018/5/23.
//  Copyright © 2018年 小熊. All rights reserved.
//

#import "GMHomeVC.h"

@interface GMHomeVC ()<UITextFieldDelegate>

@end

@implementation GMHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
   UILabel *lab = [UILabel zj_labelWithFont:[UIFont systemFontOfSize:14] lines:0 text:@"的点击的点击山东省内快捷快递设计肯定单身快乐几十块劳动竞赛的来看圣诞节快乐苏我内裤了多久说逻辑肯定就是卡斯诺克户籍地OK老司机ndsjkhwiudsqpm.smnn首单立减噢匹配；看山东矿机你打卡卢湾区欧派但是你接口的合适你穿内裤路交叉口济南市垃圾啊卡昆仑决" textColor:kDarkGrayColor superView:self.view constraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(30);
        make.trailing.equalTo(self.view).offset(-30);
        make.top.equalTo(self.view).offset(30);
    }];
    
   UIButton *btn = [UIButton zj_buttonWithTitle:@"点我" titleColor:kWhiteColor norImage:kImageName(@"video_list_cell_big_icon") selectedImage:kImageName(@"video_list_cell_big_icon") backColor:kDarkGrayColor fontSize:14 isBold:YES borderWidth:0.5 borderColor:kRedColor cornerRadius:5 supView:self.view constraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(lab.mas_bottom).offset(15);
        make.width.equalTo(@90);
        make.height.equalTo(@40);
        make.centerX.equalTo(self.view);
    } touchUp:^(id sender) {
        NSLog(@"点击了按钮");
    }];
    
    
   UITextView *textview = [UITextView zj_textViewWithFontSize:15 textColor:kRedColor borderColor:kOrangeColor borderWidth:0.5 cornerRadiu:5 placeColor:kDarkGrayColor placeText:@"请输入密码" superView:self.view constraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(lab);
        make.topMargin.equalTo(btn.mas_bottom).offset(15);
        make.height.equalTo(@60);
    }];
  UIImageView *imgView = [UIImageView zj_imageViewWithImage:kImageName(@"video_list_cell_big_icon") SuperView:self.view constraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).equalTo(@80);
        make.topMargin.equalTo(textview.mas_bottom).offset(30);
        make.width.height.equalTo(@120);
    } imgViewTap:^(UITapGestureRecognizer *gesture) {
        NSLog(@"点击了图片");
    }];
    
    
    [UITextField zj_textFieldWithHolder:@"dddd" delegate:self superView:self.view constraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(imgView.mas_bottom).offset(15);
        make.leading.equalTo(lab);
        make.width.equalTo(@210);
        make.height.equalTo(@30);
    }];

   
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIAlertController *alert =[UIAlertController zj_sheetAlertControllerWithTitle:@"这是一个弹框哦" message:@"大手大脚离开家德生科技我一请问您斯柯达" optionStyle:OptionStyleStyleOK_Cancel OkTitle:@"确定" cancelTitle:@"取消" okBlock:^{
//
//    } cancelBlock:^{
//
//    }];
    
    UIAlertController *alert=[UIAlertController zj_alertControllerWithTitle:@"多少度" message:@"ddssd点点点订单的但是结婚的的神色肯定会是亏哦去我加速度快和无穷企业没上班的接口区位优势的机会" optionStyle:OptionStyleStyleOK_Cancel OkTitle:@"ok" cancelTitle:@"cancle" okBlock:^{
        
    } cancelBlock:^{
        
    }];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
