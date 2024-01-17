#import "/momotalk/momotalk.typ": *
#import "/momotalk/files.typ": *
#import "/momotalk/characters.typ" : *
#show: doc => chat(
  doc,
  title: "MomoTalk 演示",
  author: "@XcantloadX",
)

// 介绍
#yuuka((
  "欢迎使用新的 MomoTalk “编辑器”。实际上，这是一个 Typst 模板，并不是一个独立的编辑器。",
  
  quote(attribution: "Typst 非官方中文文档", block: true)[
    Typst 是为科学写作而诞生的基于标记的排版系统。
    它被设计之初就是作为一种替代品，用于替代像 LaTeX 这样的高级工具，又或者是像 Word 和 Google Docs 这样的简单工具。
    我们对 Typst 的目标是构建一个功能强大的排版工具，并且让用户可以愉快地使用它。
  ]
))
#yuuka((
  [
    得益于 Typst 的专业性，你可以在消息里插入任何东西，例如：

    *格式化* #underline[文本，]
    #text(fill: red)[彩色文本，]
    #text(fill: gradient.linear(..color.map.rainbow))[甚至是渐变色文本。]
    #align(center)[让文本居中，] \
    #align(right)[和居右。] \
    （PS：由于字体原因，粗体和中文斜体无法显示。）
  ],
  [当然，你也可以插入图片：#image("/examples/azusa.jpg", width: 30%)],
  // arguments(no_box: true)[#image("/examples/azusa.jpg", width: 30%)],
  [
    以及标题：
    = 标题
    == 小标题
    === 小小标题
  ],
  [
    以及公式：
    
    $v := vec(x_1, x_2, x_3)$
  
    $ 7.32 beta +
    sum_(i=0)^nabla
      (Q_i (a_i - epsilon)) / 2 $
  ],
  [
    以及代码块：
    ```c
    #include <stdio.h>
    int main()
    {
      print("Hello World!");
      return 0;
    }
    ```
  ]
))

// 自定义学生演示
#nonomi[你可以选择不同的学生发送消息]
#nonomi[当然也可以自定义学生]
#let stuName = messages.with("꒰ঌ( ᗜ`v´ᗜ )໒꒱", "/examples/azusa.jpg")
#stuName[就像这样]

// 右向消息框演示
#sensei[sensei 可以发送消息]
#yuuka(direction: "right")[学生也可以在右边发送消息！]

// 其他 BA 消息演示
#system[这是一条系统消息]
#system[
  *一样的*，也可以放其他内容 \
  #box(image("azusa.jpg"), width: 10%) \
]
#hr
#azusa_swimsuit[（你就不能换张图片吗）]
#sensei[（不能）]
#azusa_swimsuit[#image("azusa.jpg", width: 30%)]
#hr

#yuuka[下面是预设卡片展示。]
#story_card("优香")
#reply_card(
  none,
  ([选项 1], [选项 2])
)
#reply_card(
  none,
  ([你没得选择])
)
#reply_card(
  [回复卡可以有内容描述，也可以没有选项。],
  none
)
#yuuka[下面是自定义卡片展示。]
#card(
  "卡片标题",
  "卡片内容",
  ("选项1", "选项2"),
  background_color: rgb("#f2fff4"),
  title_color: rgb("#21c236"),
  option_fore_color: rgb("#00FF00"),
  option_back_color: rgb("#000")
)

#yuuka[下面是扩展消息展示。]
#yuuka[语音消息：]
#yuuka((voice(5), voice(10), voice(60)))
#sensei(voice(20))
#yuuka[语音电话：]
#yuuka((
  voice_call[],
  voice_call[通话结束 01:45],
))
#sensei(voice_call[对方已拒绝])

#yuuka[行动消息：]
#action[这是一条行动消息 #emoji.thumb]
#time[15:22:41]
#unsend[优香]
#unsend[优香]
#time[以下是新消息]

#yuuka[文件消息：]
#yuuka((
  file("RABBIT dance.mp3", "3.2 MB"),
  file("a.mp4", "4.7 GB"),
  file("本月开支.xlsx", "2.7 MB", footer: [MomoTalk 电脑版])
))
#sensei(file("检讨.docx", "6.7 MB"))

#yuuka[更多消息类型正在开发中！]