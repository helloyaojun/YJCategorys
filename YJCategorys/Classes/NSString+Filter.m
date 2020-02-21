//
//  NSString-Filter.m
//  Project
//
//  Created by yj on 16/4/11.
//  Copyright © 2016年 user. All rights reserved.
//

#import "NSString+Filter.h"

@implementation NSString (Filter)
//邮箱
- (BOOL) isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%--]-@[A-Za-z0-9.-]-\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//邮政编码
- (BOOL) isValidatePostalCode:(NSString *)postalCode
{
    NSString *postalCodeRegex = @"^[1-9]\\d{5}$";
    NSPredicate *postalCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", postalCodeRegex];
    return [postalCodeTest evaluateWithObject:postalCode];
}
//手机号码验证
- (BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((1[3,7][0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//联系方式验证
- (BOOL) isValidateContact:(NSString *)phoneNumber
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    BOOL isMatch = YES;
    
    if (([regextestmobile evaluateWithObject:phoneNumber] == YES)
        || ([regextestcm evaluateWithObject:phoneNumber] == YES)
        || ([regextestct evaluateWithObject:phoneNumber] == YES)
        || ([regextestcu evaluateWithObject:phoneNumber] == YES)
        || ([regextestphs evaluateWithObject:phoneNumber] == YES)){
        isMatch = YES;
    }else{
        isMatch = NO;
    }
    return isMatch;
}

//车牌号验证
- (BOOL) isValidateCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}


//车型
- (BOOL) isValidateCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]-$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}


//用户名
- (BOOL) isValidateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}-$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}


//密码
- (BOOL) isValidatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,15}-$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


//昵称
- (BOOL) isValidateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}


//身份证号
- (BOOL) isValidateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//n位纯数字
- (BOOL) isValidateInteger: (NSString *)integerCard digits:(int)digitsNUm
{
    NSString *regex2 = [NSString stringWithFormat:@"%@%d%@",@"[0-9]{",digitsNUm,@"}"];
    NSPredicate *integerPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [integerPredicate evaluateWithObject:integerCard];
}

//正整数
- (BOOL) isValidateInteger: (NSString *)integerCard
{
    NSString *regex2 = @"^[1-9]\\d*$";
    NSPredicate *integerPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [integerPredicate evaluateWithObject:integerCard];
}
//数字和小数点
- (BOOL) isValidateIntegerPoint: (NSString *)integerCard
{
    NSString *regex2 = [NSString stringWithFormat:@"^(([0-9]-\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]-)|([0-9]*[1-9][0-9]*))$"];
    NSPredicate *integerPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [integerPredicate evaluateWithObject:integerCard];
}

//车牌号
- (BOOL) isValidateLicensePlate: (NSString *)licensePlate
{
    NSString *regex2 = [NSString stringWithFormat:@"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$"];
    NSPredicate *integerPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [integerPredicate evaluateWithObject:licensePlate];
}

//特殊字符
- (BOOL) isValidateSpecialCharacter: (NSString *)character
{
    NSString *regex2 = [NSString stringWithFormat:@"^[\u4e00-\u9fa5]|^\\w-[1-10]$"];
    NSPredicate *integerPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [integerPredicate evaluateWithObject:character];
}

//IP地址
- (BOOL)isValidIP
{
    NSString *ipRegex = @"(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])";
    NSPredicate *ipTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ipRegex];
    return [ipTest evaluateWithObject:self];
}

//Port
- (BOOL)isValidPort
{
    NSString *portRegex = @"([0-9]|[1-9]\\d|[1-9]\\d{2}|[1-9]\\d{3}|[1-5]\\d{4}|6[0-4]\\d{3}|65[0-4]\\d{2}|655[0-2]\\d|6553[0-5])";
    NSPredicate *portTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", portRegex];
    return [portTest evaluateWithObject:self];
}
@end
