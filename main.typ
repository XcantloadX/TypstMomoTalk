#import "momotalk.typ": chat, msgbox, messages
#import "characters.typ" : *
#show: doc => chat(doc)

== 单个消息框演示
```typst
#msgbox[测试文本]
#msgbox[
  换行与分段。
  
  类似于 Markdown，空一行即表示分段。
  
  也可以用 \ 来强制换行。
]
```
#msgbox[测试文本（左侧）]
#msgbox(direction: "right")[测试文本（右侧）]
#msgbox(direction: "none")[测试文本（无）]
#msgbox[测试文本]
#msgbox[
  换行与分段。
  
  类似于 Markdown，空一行即表示分段。
  
  也可以用 \ 来强制换行。
]

```typst
#msgbox[测试图片 width=110pt #image("examples/azusa.jpg", width: 110pt)]
```
#msgbox[\#msgbox 支持任意 Typst 支持的内容，例如：]
#msgbox[
  == 图片
  width=110pt
  #image("examples/azusa.jpg", width: 110pt)]
#msgbox[
  == 公式
  
  $a + b = c$
  
  $v := vec(x_1, x_2, x_3)$

  $ 7.32 beta +
  sum_(i=0)^nabla
    (Q_i (a_i - epsilon)) / 2 $
]
\
== 多个消息演示
#messages(
  "野宫",
  "assets/nonomi.png",
  ("测试内容 第一行", "测试内容 第二行", emoji.face)
)

#野宫(("123",))
