--[==========================================[--
   L3BUILD FILE FOR INSTALL-LATEX-GUIDE-ZH-CN
     Check PDF File & Directory After Build
--]==========================================]--

--[==========================================[--
                Basic Information
             Do Check Before Upload
--]==========================================]--
module           = "install-latex-guide-zh-cn"
version          = "2025.6.1"
maintainer       = "Ran Wang"
uploader         = maintainer
maintainid       = "OsbertWang"
email            = "ranwang.osbert@outlook.com"
repository       = "https://github.com/" .. maintainid .. "/" .. module
announcement     = ""
note             = "The document now introduces Ubuntu 24.04 instead of 22.04. Please sync the homepage of this package accordingly."
summary          = "A short introduction to LaTeX installation written in Chinese"
description      = [[
This package will introduce the operations related to installing TeX Live (introducing MacTeX in macOS), upgrading packages, and compiling simple documents on Windows 11, Ubuntu 24.04, and macOS systems, and mainly introducing command line operations.
]]

--[==========================================[--
         Build, Pack and Upload To CTAN
         Do not Modify Unless Necessary
--]==========================================]--
ctanzip          = module
excludefiles     = {"*~"}
supportdir       = "chapter"
textfiles        = {"*.md", "LICENSE", "*.lua", "makefile", "*.bat"}
typesetexe       = "latexmk"
typesetfiles     = {module .. ".tex"}
typesetopts      = "-xelatex -synctex=1 -interaction=nonstopmode"
typesetsuppfiles = {"*.tex"}

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

function docinit_hook()
  local docsuppdir = typesetdir .. "/" .. supportdir
  mkdir(docsuppdir)
  for _,supp in pairs(typesetsuppfiles) do
    cp(supp, supportdir, docsuppdir)
    rm(typesetdir, supp)
  end
  cp(module .. ".tex", currentdir, typesetdir)
  return 0
end
function tex(file,dir,cmd)
  dir = dir or "."
  cmd = cmd or typesetexe .. " " .. typesetopts
  return run(dir, cmd .. file)
end
function copyctan()
  local pkgdir = ctandir .. "/" .. ctanpkg
  mkdir(pkgdir)
  for _,main in ipairs({typesetsuppfiles, pdffiles}) do
    for _,glob in pairs(main) do
      cp(glob, typesetdir, pkgdir)
    end
  end
  local pkgsuppdir = ctandir .. "/" .. ctanpkg .. "/" .. supportdir
  mkdir(pkgsuppdir)
  for _,supptab in pairs(typesetsuppfiles) do
    cp(supptab, supportdir, pkgsuppdir)
  end
end