# SVGDemo
> svg图片的size不管怎么变，都不会失真。所以有时候可以用svg代替png图片。
 
---
## 显示SVG图片
如果只是显示svg图片，有好几种方法。但是都有优缺点。

---
### 使用webview显示
使用`UIWebView`和`WKWebView`，关键代码如下。

```swift
if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: tigerPath ?? "")) {
            let dataStr = String.init(data: data, encoding: .utf8) ?? ""
            wkWebView.loadHTMLString(dataStr, baseURL: nil)
            webView.loadHTMLString(dataStr, baseURL: nil)
        }
```

---

### 使用SVGKit显示
[SVGKit](https://github.com/SVGKit/SVGKit)是用`Objective-C`写的，专门处理svg的第三方框架。

- 使用`UIImageView`显示
 
```swift
       let svgView = UIImageView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        ///创建SVGKImage
        let svgImage = SVGKImage.init(named: "ICO 好妈圈@2x 2.svg")!
        svgView.image = svgImage.uiImage
        ///可以自己设置大小，有些svg没有设置size，这里需要设置下
        //        svgImage.size = .init(width: 100, height: 100)
        view.addSubview(svgView)
```

- 使用`SVGKFastImageView`显示
 
```swift
        let svgImage = SVGKImage.init(named: "ICO 好妈圈@2x 2.svg")!
        let svgImgView = SVGKFastImageView.init(svgkImage: svgImage)!
        svgImgView.frame = .init(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(svgImgView)
```
---
### 使用Macaw显示
[Macaw](https://github.com/exyte/Macaw)是个可以显示很多样式的`Swift`框架。

```swift
       if let node = try? SVGParser.parse(fullPath: tigerPath ?? "") {
            let svgView = SVGView.init(node: node, frame: view.bounds)
            view.addSubview(svgView)
        }
```
---

## 使用SVGKit的问题
由于工程里改的图片是tabbaritem的。所以需要拿到`UIImage`。所以只能使用`SVGKit`。使用过程中也遇到一些。

---
### 颜色显示不对

svg图片在浏览器里颜色是深灰色的，![原图](https://upload-images.jianshu.io/upload_images/1715760-dac79a089349389f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
但是使用SVGKit后显示的是黑色的，和原图不一样。
![svg显示的图](https://upload-images.jianshu.io/upload_images/1715760-2d27678180046b7a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
查了半天才查到问题。[是css名字的问题](https://github.com/SVGKit/SVGKit/pull/601)，也是Photoshop的坑。

```
  <style>
      .cls-1 {
        fill: #666;
        fill-rule: evenodd;
      }
    </style>
```

`cls-1`在`SVGKit`中会解析不了。所以把样式里面的`-`都去掉就行了。
由于我的`svg`文件都是从**`Photoshop`**中导出的，里面的样式命名全部是`cls-1`这样的。
所以，如果你的svg文件是**`Photoshop`**中导出的，一定自己手动把所有的`-`去掉。

---
### 滤镜效果不显示

如果`svg`中带有`filter`，那么`SVGKit`和`Macaw `都不能显示滤镜效果。
这个问题，现在我也没找到解决方法。

---
## 三种显示方式对比
`SVGKit`的功能要多一些，可以满足大部分需求。

特点  | `webView`|`SVGKit`|`Macaw`
------------- | ------|----|---
显示`filter`  | 可以  |   不  |     不|
加载速度 | 慢|快|快|
拿到`UIImage`|不|可以|不
---
[gitHub](https://github.com/HanksHu/SVGDemo)

