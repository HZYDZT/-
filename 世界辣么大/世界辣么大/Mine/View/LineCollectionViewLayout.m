//
//  LineCollectionViewLayout.m
//  世界辣么大
//
//  Created by dllo on 16/3/16.
//  Copyright © 2016年 洪振宇. All rights reserved.
//

#import "LineCollectionViewLayout.h"

@implementation LineCollectionViewLayout
- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}


- (void)prepareLayout{
    // 进行一些初始化 的设置
    self.itemSize = CGSizeMake(100, 100);
    self.scrollDirection = 1;
    self.minimumLineSpacing = 100;
    CGFloat inset = (self.collectionView.frame.size.width - 100)*0.5;
    self.sectionInset = UIEdgeInsetsMake(50, inset, 0, inset);
    
    // 每个Item 都有自己的UICollectionViewLayoutAttributes属性
    //  每个indexPath都有自己的UICollectionViewLayoutAttributes 属性
    
}

//  所有item的所有属性 都存在数组里面
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    CGRect visRect;
    visRect.size = self.collectionView.frame.size;
    visRect.origin = self.collectionView.contentOffset;
    
    // 拿到所有item的所有属性 调用父类方法
    NSArray *atts = [super layoutAttributesForElementsInRect:rect];
    
    
    
    CGFloat centerX = self.collectionView.frame.size.width*0.5 + self.collectionView.contentOffset.x;
    for (UICollectionViewLayoutAttributes *att in atts) {
        if (!CGRectIntersectsRect(visRect, att.frame)) continue;
        //        NSLog(@"%@", temp);
        //  只计算可见范围的
        CGFloat scale = 1 + (1 - ABS(att.center.x - centerX)/ 320);
        NSLog(@"%.2f", scale);
        att.transform3D = CATransform3DMakeScale(scale, scale, 0);
    }
    
    return atts;
    
}

// 只要显示的区域发生变化, 就会重新布局
// 内部会重新调用prepareLayout 和 layoutAttributesForElementsInRect 方法
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}


@end
