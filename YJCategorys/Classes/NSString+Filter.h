//
//  NSString-Filter.h
//  Project
//
//  Created by yj on 16/4/11.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Filter)

#pragma mark - 正则

//邮箱
- (BOOL) isValidateEmail:(NSString *)email;

//邮政编码
- (BOOL) isValidatePostalCode:(NSString *)postalCode;

//手机号码验证
- (BOOL) isValidateMobile:(NSString *)mobile;

//联系方式验证
- (BOOL) isValidateContact:(NSString *)phoneNumber;

//车牌号验证
- (BOOL) isValidateCarNo:(NSString *)carNo;

//车型
- (BOOL) isValidateCarType:(NSString *)CarType;

//用户名
- (BOOL) isValidateUserName:(NSString *)name;

//密码
- (BOOL) isValidatePassword:(NSString *)passWord;

//昵称
- (BOOL) isValidateNickname:(NSString *)nickname;

//身份证号
- (BOOL) isValidateIdentityCard: (NSString *)identityCard;

//n位纯数字
- (BOOL) isValidateInteger: (NSString *)integerCard digits:(int)digitsNUm;

//纯数字
- (BOOL) isValidateInteger: (NSString *)integerCard;

//数字和小数点
- (BOOL) isValidateIntegerPoint: (NSString *)integerCard;

//车牌号
- (BOOL) isValidateLicensePlate: (NSString *)licensePlate;

//特殊字符
- (BOOL) isValidateSpecialCharacter: (NSString *)character;

//IP地址
- (BOOL)isValidIP;

//Port
- (BOOL)isValidPort;

@end
