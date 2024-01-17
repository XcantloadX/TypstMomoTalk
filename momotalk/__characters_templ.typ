#import "momotalk.typ": chat, msgbox, messages
#import "momotalk.typ": COLOR_MSGBOX_SENSEI_BG

#let __wrap(name, filename) = messages.with(name, filename)

#let sensei = messages.with(none, none, direction: "right", background_color: COLOR_MSGBOX_SENSEI_BG)
#let laoshi = sensei
#let 老师 = sensei
