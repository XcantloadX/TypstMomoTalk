#let img = image("momotalk/assets/azusa.png", fit: "contain")
// #style(styles => {
//   let block = block(
//   img,
//   inset: 0pt,
//   outset: 0pt,
//   clip: true,
//   // width: 50pt,
//   // height: 50pt,
//   radius: 100%
//   )
//   let size = measure(block, styles)
//   scale(block, x: (size.width / 50pt))
// })

#style(styles => {
  let size = measure(img, styles)
  // 需要让图像的 x 放大到
  let x = (50pt / size.width) * 100%
  let y = (50pt / size.height) * 100%
  x = 120%
  y = 120%
  [#x, #y]
  let img = scale(img, x: x, y: y)
  let block = block(
    align(img, center),
    inset: 0pt,
    outset: 0pt,
    clip: true,
    width: 50pt,
    height: 50pt,
    radius: 25pt
  )
  block
})
// #block(
// align(img, center),
// inset: 0pt,
// outset: 0pt,
// clip: true,
// width: 50pt,
// height: 50pt,
// radius: 25pt
// )