UIImageView-PersentageCircle
============================

Creates a ImageView with a circle and text that is displaying the persentage

![alt text](http://www.fudgecode.de/wp-content/uploads/2014/02/persentCircle.jpg "Persentage Circle")

Its fully tested on iOS 7.

###All you have to do:

<ol>
<li>Import the file in your class:</li>
```objc
#import "UIImageView+PersentageCircle.h"
```

<li>To show the circle on the right side of your UITableViewCell add the following to ``- tableView: cellForRowAtIndexPath:``:</li>
```objc
UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
cell.accessoryView = [view applyCircleWithPersentage:<#yourOwnPersentage#> andTintColor:[UIColor orangeColor];
```

<li>Or for the left side of the cell:</li>
```objc
UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
[view applyCircleWithPersentage:<#yourOwnPersentage#> andTintColor:[UIColor orangeColor];
cell.imageView.image = view.image;
```

<li>The last step is to change the height of the cells with:</li>
```objc
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}
```

<li>Now you can customise the circle in ``UIImageView+PersentageCircle.m``</li>
</ol>

And now you should have your own percentage circle!

A german tutorial is availabe soon under: [FudgeCode.de]


[FudgeCode.de]: http://www.fudgecode.de