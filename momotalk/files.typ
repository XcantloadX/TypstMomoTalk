#import "momotalk.typ" : *

#let FORMAT_VIDEO = "assets/files/video.svg"
#let FORMAT_AUDIO = "assets/files/audio.svg"
#let FORMAT_IMAGE = "assets/files/image.svg"
#let FORMAT_TEXT = "assets/files/txt.svg"
#let FORMAT_PDF = "assets/files/pdf.svg"
#let FORMAT_DOCUMENT = "assets/files/document.svg"
#let FORMAT_SHEET = "assets/files/sheet.svg"
#let FORMAT_SLIDES = "assets/files/slides.svg"
#let FORMAT_ARCHIVE = "assets/files/pack.svg"
#let FORMAT_CODE = "assets/files/code.svg"
#let FORMAT_EXECUTABLE = "assets/files/exe.svg"
#let FORMAT_PSD = "assets/files/psd.svg"
#let FORMAT_UNKNOWN = "assets/files/unknown.svg"

#let ICON_MAP = (
  // 音频
  "mp3": FORMAT_AUDIO,
  "wav": FORMAT_AUDIO,
  "flac": FORMAT_AUDIO,
  "ape": FORMAT_AUDIO,
  "aac": FORMAT_AUDIO,
  "ogg": FORMAT_AUDIO,
  "wma": FORMAT_AUDIO,
  "m4a": FORMAT_AUDIO,
  // 视频
  "mp4": FORMAT_VIDEO,
  "avi": FORMAT_VIDEO,
  "mkv": FORMAT_VIDEO,
  "rmvb": FORMAT_VIDEO,
  "rm": FORMAT_VIDEO,
  "wmv": FORMAT_VIDEO,
  "mov": FORMAT_VIDEO,
  "flv": FORMAT_VIDEO,
  "f4v": FORMAT_VIDEO,
  "m4v": FORMAT_VIDEO,
  "3gp": FORMAT_VIDEO,
  "3g2": FORMAT_VIDEO,
  "webm": FORMAT_VIDEO,
  // 图片
  "jpg": FORMAT_IMAGE,
  "jpeg": FORMAT_IMAGE,
  "png": FORMAT_IMAGE,
  "gif": FORMAT_IMAGE,
  "bmp": FORMAT_IMAGE,
  "webp": FORMAT_IMAGE,
  "tiff": FORMAT_IMAGE,
  "svg": FORMAT_IMAGE,
  // 文档
  "pdf": FORMAT_PDF,
  "doc": FORMAT_DOCUMENT,
  "docx": FORMAT_DOCUMENT,
  "xls": FORMAT_SHEET,
  "xlsx": FORMAT_SHEET,
  "ppt": FORMAT_SLIDES,
  "pptx": FORMAT_SLIDES,
  // 压缩包
  "zip": FORMAT_ARCHIVE,
  "rar": FORMAT_ARCHIVE,
  "7z": FORMAT_ARCHIVE,
  "tar": FORMAT_ARCHIVE,
  "gz": FORMAT_ARCHIVE,
  "bz2": FORMAT_ARCHIVE,
  "xz": FORMAT_ARCHIVE,
  "z": FORMAT_ARCHIVE,
  "lz": FORMAT_ARCHIVE,
  "lzma": FORMAT_ARCHIVE,
  "cab": FORMAT_ARCHIVE,
  "iso": FORMAT_ARCHIVE,
  // 代码
  "c": FORMAT_CODE,
  "cpp": FORMAT_CODE,
  "h": FORMAT_CODE,
  "hpp": FORMAT_CODE,
  "java": FORMAT_CODE,
  "cs": FORMAT_CODE,
  "py": FORMAT_CODE,
  "go": FORMAT_CODE,
  "js": FORMAT_CODE,
  "ts": FORMAT_CODE,
  "html": FORMAT_CODE,
  "css": FORMAT_CODE,
  "php": FORMAT_CODE,
  "json": FORMAT_CODE,
  "xml": FORMAT_CODE,
  "md": FORMAT_CODE,
  "sh": FORMAT_CODE,
  "bat": FORMAT_CODE,
  // 其他
  "exe": FORMAT_EXECUTABLE,
  "txt": FORMAT_TEXT,
  "psd": FORMAT_PSD,
)

// 产生一条文件消息内容。
// @param file_icon str 文件图标路径
// @param file_name str 文件名
// @param file_size str 文件大小
// @param footer str|content|none 附加信息
#let __file(
  file_icon,
  file_name,
  file_size,
  footer: "MomoTalk 手机版",
) = {
  // 参数检查
  if (file_icon == none) {
    panic("file_icon is none")
  }
  if (file_name == none) {
    panic("file_name is none")
  }
  if (file_size == none) {
    panic("file_size is none")
  }

  // 渲染
  let result = rect(
    radius: 3pt,
    stroke: 0.5pt + rgb("#e0e0e0"),
    inset: 10pt,
    width: 15em
  )[
    #grid(
      columns: (auto, 1fr),
      rows: 1,
      column-gutter: 1.5em,
      [
        #file_name \
        #align(text(size: 0.8em, fill: rgb("#999"))[#file_size], left)
      ],
      align(image(file_icon, width: 3em), right)
    )
    #text(size: 0.8em, fill: rgb("#999"))[#footer]
  ]
  // 以无边框消息返回
  arguments(no_box: true, result)
}

// 产生一条文件消息内容。
// @param file_name str 文件名
// @param file_size str 文件大小
// @param footer str|content|none 附加信息
#let file(
  file_name,
  file_size,
  footer: "MomoTalk 手机版",
) = {
  // 自动判断文件类型
  let file_icon = none
  let file_ext = file_name.split(".").at(-1)
  __file(
    ICON_MAP.at(file_ext, default: FORMAT_UNKNOWN),
    file_name,
    file_size,
    footer: footer,
  )
}