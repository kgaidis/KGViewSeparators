## Overview
**KGViewSeparators** is a small helper library that helps to quickly insert separators into a view. No subclassing required!

Ease of use and customization is not the only benefit. The library especially helps when it comes to cell reuse: it prevents multiple separators from being added to a single view, you can show/hide separators for any cell and more. All you have to worry about is specifying when you want to show/hide a separator and it will just work.

The library currently allows to modify the color, lineWidth and the insets of the separators.

Core Principles:

1. Ease of use
2. Customization
3. Support for view reuse


## How to Use

### Imports:

```objective-c
#import <UIView+KGViewSeparators.h>
#import <UITableViewCell+KGViewSeparators.h>
```

### Usage:

```objective-c
[view kg_showTopSeparator:YES color:[UIColor blackColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
[view kg_showBottomSeparator:YES color:[UIColor blackColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
```

### Recommended usage:
Create your own category to simplify code.

```objective-c
@interface UITableViewCell (Separators)
- (void)showTopSeparator:(BOOL)show;
- (void)showBottomSeparator:(BOOL)show;
@end

```

```objective-c
#import <UITableViewCell+KGViewSeparators.h>
@implementation UITableViewCell (Separators)
- (void)showTopSeparator:(BOOL)show {
    [self kg_showTopSeparator:YES color:[UIColor blackColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
}
- (void)showBottomSeparator:(BOOL)show {
    [self kg_showBottomSeparator:YES color:[UIColor blackColor] lineWidth:1.0 insets:UIEdgeInsetsZero];
}
@end
```

### Important note:
While there is a helper `UITableViewCell` category, it's important to add separators to the **content view** of the cell.

## Swift Support
KGViewSeparators works with Swift! Checkout the Swift example in the "Examples" folder.

## How Does it Work
KGViewSeparators uses [associated objects](http://nshipster.com/associated-objects/) to store the separator views and the layout is done via Auto Layout. Once stored, the views are simply shown or hidden. By storing the separator views, and the configurations that customize the separators, the library is able to reuse what was already created.

## Credits
Created and maintained by Krisjanis Gaidis. 

## License
KGViewSeparators is released under the MIT license. See LICENSE for details.