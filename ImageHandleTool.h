//
//  ImageHandleTool.h
//  自定义视图
//
//  Created by 陈辉金 on 2020/6/9.
//  Copyright © 2020 chj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface ImageHandleTool : NSObject
/// 图片裁剪成圆形图片
/// @param image 要切割的图片
+ (UIImage *)pictureCutAction:(UIImage *)image;

/// 图片裁剪成带边框的圆形图片
/// @param image 要切割的图片
/// @param borderF 边框宽度
/// @param borderColor 边框颜色
+ (UIImage *)pictureCutAction:(UIImage *)image borderWidth:(CGFloat)borderF borderColor:(UIColor *)borderColor;

/// 合成图片
/// @param image1 填充的图片
/// @param image2 被填充的图片
/// @param rect 底部图片的位置和大小
+ (UIImage *)pictureSynthesisAction:(UIImage *)image1 toImage:(UIImage *)image2 rect:(CGRect)rect;

/// 添加文字水印
/// @param image 图片
/// @param text 水印文字
/// @param point 位置
/// @param attributes 文字样式
+ (UIImage *)addTextToImage:(UIImage *)image withText:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributes;

@end

NS_ASSUME_NONNULL_END
