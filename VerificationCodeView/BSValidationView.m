//
//  BSValidationView.m
//  VerificationCodeView
//
//  Created by LSFB on 2017/6/4.
//  Copyright © 2017年 BlueStorm. All rights reserved.
//

#import "BSValidationView.h"

#define RandomColor  [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0];
#define LineCount 6
#define LineWidth 1.0
#define CharCount 5
#define FontSize [UIFont systemFontOfSize:arc4random() % 5 + 15]

@implementation BSValidationView

@synthesize changeString,changeArray,lineCount,codeLength;

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.layer.cornerRadius = 5.0; //设置layer圆角半径
        self.layer.masksToBounds = YES; //隐藏边界
        self.backgroundColor = RandomColor;
        
        //显示一个随机验证码
        [self changeCaptcha];
    }
    
    return self;
}

#pragma mark 更换验证码,得到更换的验证码的字符串
- (void)changeCaptcha {
    //从字符数组中随机抽取相应数量的字符，组成验证码字符串
    //数组中存放的是全部可选的字符，可以是字母，也可以是中文
    self.changeArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    
    //如果能确定最大需要的容量，使用initWithCapacity:来设置，好处是当元素个数不超过容量时，添加元素不需要重新分配内存
    NSMutableString *getStr = [[NSMutableString alloc] initWithCapacity:CharCount];
    self.changeString = [[NSMutableString alloc] initWithCapacity:CharCount];
    
    //随机从数组中选取需要个数的字符，然后拼接为一个字符串
    
    for(int i = 0; i < CharCount; i++)
    {
        NSInteger index = arc4random() % ([self.changeArray count] - 1);
        getStr = [self.changeArray objectAtIndex:index];
        
        self.changeString = (NSMutableString *)[self.changeString stringByAppendingString:getStr];
    }
}

#pragma mark - 点击view时调用
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //点击切换验证码
    [self changeCaptcha];
    
    //setNeedsDisplay调用drawRect方法来实现view的绘制
    [self setNeedsDisplay];
    NSLog(@"%@",self.changeString);
}

#pragma mark - 绘制界面
- (void)drawRect:(CGRect)rect {

    [super drawRect:rect];
    //随机背景颜色
    self.backgroundColor = RandomColor;
    //获得要显示验证码字符串
    NSString *text = [NSString stringWithFormat:@"%@",self.changeString];
    CGSize cSize = [@"S" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}]; int width = rect.size.width / text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    CGPoint point;
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX, pY;
    for (int i = 0; i < text.length; i++) {
        pX = arc4random() % width + rect.size.width / text.length * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:FontSize}];
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画线宽度
    CGContextSetLineWidth(context, LineWidth);
    //绘制干扰的彩色直线
    for(int i = 0; i < LineCount; i++) {
        //设置线的随机颜色
        UIColor *color = RandomColor;
        CGContextSetStrokeColorWithColor(context, [color CGColor]);
        //设置线的起点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(context, pX, pY);
        //设置线终点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        //画线
        CGContextStrokePath(context);
    }
}


@end
