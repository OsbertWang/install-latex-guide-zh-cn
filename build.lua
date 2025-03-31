--[==========================================[--
   L3BUILD FILE FOR INSTALL-LATEX-GUIDE-ZH-CN
     Check PDF File & Directory After Build
--]==========================================]--

--[==========================================[--
                Basic Information
             Do Check Before Upload
--]==========================================]--
module           = "install-latex-guide-zh-cn"
version          = "v2025.4.1"
maintainer       = "Ran Wang"
maintainid       = "OsbertWang"
email            = "ranwang.osbert@outlook.com"
announcement     = ""
summary          = "A short introduction to LaTeX installation written in Chinese"
description      = [[
  This package will introduce the operations related to installing TeX Live (introducing MacTeX in macOS), upgrading packages, and compiling simple documents on Windows 11, Ubuntu 22.04, and macOS systems, and mainly introducing command line operations.
]]


--[==========================================[--
            Pack and Upload To CTAN
         Don't Modify Unless Necessary
--]==========================================]--
typesetexe       = "xelatex"
typesetopts      = "-interaction=nonstopmode -synctex=1"
typesetfiles     = {module .. ".tex"}
supportdir       = "chapter"
typesetsuppfiles = {"*.tex"}
textfiles        = {"*.md", "LICENSE", "*.lua", "*.bat", "makefile"}
excludefiles     = {"*~"}
ctanzip          = module

function copyctan()
  local pkgsuppdir = ctandir .. "/" .. ctanpkg .. "/" .. supportdir
  mkdir(pkgsuppdir)
  for _,supptab in pairs(typesetsuppfiles) do
    cp(supptab, supportdir, pkgsuppdir)
  end
  local pkgdir = ctandir .. "/" .. ctanpkg
  mkdir(pkgdir)
  local function copyfiles(files,source)
    for _,filetype in pairs(files) do
      cp(filetype,source,pkgdir)
    end
  end
  for _,tab in pairs({pdffiles,typesetlist}) do
    copyfiles(tab,docfiledir)
  end
  for _,file in pairs(textfiles) do
    cp(file, textfiledir, pkgdir)
  end
end

uploadconfig = {
  pkg          = module,
  version      = version,
  author       = maintainer,
  uploader     = maintainer,
  email        = email,
  summary      = summary,
  description  = description,
  announcement = announcement,
  license      = "lppl1.3c",  
  ctanPath     = "/info/" .. module,
  home         = "https://github.com/" .. maintainid .. "/" .. module,
  bugtracker   = "https://github.com/" .. maintainid .. "/" .. module .. "/issues",
  repository   = "https://github.com/" .. maintainid .. "/" .. module,
  development  = "https://github.com/" .. maintainid,
  update       = true
}