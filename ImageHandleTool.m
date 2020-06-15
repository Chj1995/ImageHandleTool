//
//  XKImageHandleTool.m
//  自定义视图
//
//  Created by 陈辉金 on 2020/6/9.
//  Copyright © 2020 chj. All rights reserved.
//

#import "ImageHandleTool.h"


@implementation ImageHandleTool
/// 图片裁剪成圆形图片
/// @param image 要切割的图片
+ (UIImage *)pictureCutAction:(UIImage *)image {
    CGFloat sizeWidth = image.size.width;
    CGFloat sizeHeight = image.size.height;

    UIGraphicsBeginImageContext(image.size);

    UIBezierPath * clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, sizeWidth, sizeHeight)];
     [clipPath addClip];

    [image drawAtPoint:CGPointZero];

    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return resultImage;
}

/// 图片裁剪成带边框的圆形图片
/// @param image 要切割的图片
/// @param borderF 边框宽度
/// @param borderColor 边框颜色
+ (UIImage *)pictureCutAction:(UIImage *)image borderWidth:(CGFloat)borderF borderColor:(UIColor *)borderColor {
    CGFloat sizeWidth = image.size.width;
    CGFloat sizeHeight = image.size.height;

    UIGraphicsBeginImageContext(image.size);
    
    //设置边框
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, sizeWidth, sizeHeight)];
    [borderColor setFill];
    [borderPath fill];

     UIBezierPath * clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderF , borderF , sizeWidth - borderF * 2, sizeHeight - borderF *2)];
     [clipPath addClip];

    [image drawAtPoint:CGPointZero];

    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return resultImage;
}
/// 合成图片
/// @param image1 填充的图片
/// @param image2 被填充的图片
/// @param rect 底部图片的位置和大小
+ (UIImage *)pictureSynthesisAction:(UIImage *)image1 toImage:(UIImage *)image2 rect:(CGRect)rect {
    CGFloat sizeWidth = image2.size.width;
    CGFloat sizeHeight = image2.size.height;

    //切圆
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sizeWidth, sizeHeight), false, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, sizeWidth, sizeHeight) cornerRadius:sizeHeight / 2] addClip];
    [image2 drawInRect:CGRectMake(0, 0, sizeWidth, sizeHeight)];
    image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //合成图片
    CGFloat propF = image1.size.width / image1.size.height;
    sizeWidth = image2.size.width * propF;
    UIGraphicsBeginImageContext(CGSizeMake(sizeWidth,sizeHeight));
    [image2 drawInRect:rect];
    [image1 drawInRect:CGRectMake(0, 0, sizeWidth, sizeHeight)];
    UIImage *synthesisImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return synthesisImage;
}

/// 添加文字水印
/// @param image 图片
/// @param text 水印文字
/// @param point 位置
/// @param attributes 文字样式
+ (UIImage *)addTextToImage:(UIImage *)image withText:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributes{
    // 计算图片的size
    CGSize imageSize = CGSizeMake(image.size.width, image.size.height);
    // 开启图片类型的图形上下文
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    // 绘制图片
    [image drawAtPoint:CGPointZero];
    // 绘制文字水印
    [text drawAtPoint:point withAttributes:attributes];
//    // 水印的图片
//    UIImage *logoImage = [UIImage imageNamed:@"FZSDKLib.bundle/companyLogo"];
//    // 绘制图片水印
//    [logoImage drawAtPoint:CGPointMake(imageSize.width - logoImage.size.width - 30, imageSize.height - logoImage.size.height - 30)];

    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

@end
