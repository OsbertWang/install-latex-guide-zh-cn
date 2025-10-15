[![CTAN Version](https://img.shields.io/ctan/v/install-latex-guide-zh-cn)](https://ctan.org/pkg/install-latex-guide-zh-cn)
[![GitHub Release](https://img.shields.io/github/v/release/OsbertWang/install-latex-guide-zh-cn)](https://github.com/OsbertWang/install-latex-guide-zh-cn/releases/latest)
[![GitHub Repo stars](https://img.shields.io/github/stars/OsbertWang/install-latex-guide-zh-cn)](https://github.com/OsbertWang/install-latex-guide-zh-cn)
[![Actions Status](https://github.com/OsbertWang/install-latex-guide-zh-cn/workflows/Automated%20testing/badge.svg)](https://github.com/OsbertWang/install-latex-guide-zh-cn/actions)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/OsbertWang/install-latex-guide-zh-cn)](https://github.com/OsbertWang/install-latex-guide-zh-cn/commits)
# Install-LaTeX-Guide-zh-cn (A short introduction to LaTeX installation written in Chinese)

This package will introduce the operations related to installing TeX Live (including MacTeX on macOS), upgrading packages, and compiling simple documents on Windows 11, Ubuntu 24.04, and macOS systems, and mainly introducing command-line operations.
At the same time, it briefly introduces the use of several common editors under different operating systems, and additionally adds some related content using Online LaTeX editor, e.g., [Overleaf](https://www.overleaf.com).

Users are advised to read [texlive-zh-cn](https://www.tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf) and [lshort-zh-cn](http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf) for a more comprehensive understanding of the basic content.

The code involved in this article also asks users to do more, don't simply copy and paste.

If you need to compile the source files, please make sure to install the fandol font and use the `xelatex` command.
TeX Live users are recommended to use the following commands
```
latexmk -xelatex -synctex=1 install-latex-guide-zh-cn
```
Users who cannot use `latexmk` can execute `make.bat` or `make` according to their operating system. `build.lua` is also provided so that users can execute `l3build doc` or `l3build ctan` to compile the source files.

If you need the PDF file compiled by this project, you can download it from [Releases](https://github.com/OsbertWang/install-latex-zh-cn/releases/latest).

# License

This work is released under the LaTeX Project Public License, v1.3c or later.

# 一份简短的关于 LaTeX 安装的介绍

本文将介绍 Windows 11、Ubuntu 24.04 和 macOS 系统中安装 TeX Live (在 macOS 中介绍 MacTeX)、升级宏包、编译简易文档的相关操作, 并多以介绍命令行操作为主.
同时简要介绍不同操作系统下几款常见编辑器的使用方法, 并额外补充了一些使用在线 LaTeX 编辑器, 如 [Overleaf](https://www.overleaf.com), 的相关内容.

建议用户阅读 [texlive-zh-cn](https://www.tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf) 和 [lshort-zh-cn](http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf) 以更全面地了解基础内容.

本文所涉及到的代码还请用户多多动手, 不要简单地复制粘贴.

若需要编译源文件, 请确保安装 fandol 字体, 并使用 `xelatex` 命令.
推荐 TeX Live 用户使用如下命令
```
latexmk -xelatex -synctex=1 install-latex-guide-zh-cn
```
无法使用 `latexmk` 的用户可以根据自己的操作系统执行 `make.bat` 或 `make`. 本项目同时提供了 `build.lua`, 用户可执行 `l3build doc` 或 `l3build ctan` 来编译源文件.

若需要本项目编译完成的 PDF 文件, 可至 [Releases](https://github.com/OsbertWang/install-latex-zh-cn/releases/latest) 处下载.

# 开源协议

本次工作将遵循协议 LaTeX Project Public License, v1.3c 或其后版本.
