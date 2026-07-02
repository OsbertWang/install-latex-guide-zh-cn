--[==========================================[--
   L3BUILD FILE FOR INSTALL-LATEX-GUIDE-ZH-CN
     Check PDF File & Directory After Build
--]==========================================]--

--[==========================================[--
                Basic Information
             Do Check Before Upload
--]==========================================]--
module           = "install-latex-guide-zh-cn"
version          = "2026.7.1"
maintainer       = "Ran Wang"
uploader         = maintainer
maintainid       = "OsbertWang"
email            = "ranwang.osbert@outlook.com"
repository       = "https://github.com/" .. maintainid .. "/" .. module
announcement     = ""
note             = ""
summary          = "A short introduction to LaTeX installation written in Chinese"
description      = [[This package will introduce the operations related to installing TeX Live (introducing MacTeX in macOS), upgrading packages, and compiling simple documents on Windows 11, Ubuntu 24.04, and macOS systems, and mainly introducing command line operations.]]

--[==========================================[--
         Build, Pack and Upload To CTAN
         Do not Modify Unless Necessary
--]==========================================]--

sourcefiles      = {module .. ".tex"}
textfiles        = {"*.md", "LICENSE", "*.lua", "makefile", "*.bat"}
excludefiles     = {"*~"}
ctanzip          = module

typesetexe       = "latexmk"
typesetopts      = "-pdfxe -interaction=nonstopmode"
typesetfiles     = {module .. ".tex"}
typesetruns      = 1

uploadconfig = {
  pkg          = module,
  version      = version,
  author       = maintainer,
  uploader     = uploader,
  email        = email,
  summary      = summary,
  description  = description,
  announcement = announcement,
  note         = note,
  license      = "lppl1.3c",  
  ctanPath     = "/info/" .. module,
  home         = repository,
  support      = repository .. "/issues",
  bugtracker   = repository .. "/issues",
  repository   = repository,
  development  = "https://github.com/" .. maintainid,
  update       = true
}

--[==========================================[--
         Custom Hooks for Directory Structure
--]==========================================]--

function tex(file, dir, cmd)
  dir = dir or "."
  cmd = cmd or typesetexe .. " " .. typesetopts .. " "
  return run(dir, cmd .. file)
end

function docinit_hook()
  mkdir(typesetdir .. "/chapter")
  cp("*.tex", "chapter", typesetdir .. "/chapter")
  return 0
end

function copyctan()
  local target = ctandir .. "/" .. ctanpkg
  mkdir(target)
  cp(module .. ".tex", ".", target)
  cp(module .. ".pdf", typesetdir, target)

  for _, f in ipairs(textfiles) do
    cp(f, ".", target)
  end
  
  mkdir(target .. "/chapter")
  cp("*.tex", "chapter", target .. "/chapter")

  return 0
end