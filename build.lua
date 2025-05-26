--[==========================================[--
   L3BUILD FILE FOR INSTALL-LATEX-GUIDE-ZH-CN
     Check PDF File & Directory After Build
--]==========================================]--

--[==========================================[--
                Basic Information
             Do Check Before Upload
--]==========================================]--
module           = "install-latex-guide-zh-cn"
version          = "v2025.5.1"
maintainer       = "Ran Wang"
uploader         = maintainer
maintainid       = "OsbertWang"
email            = "ranwang.osbert@outlook.com"
repository       = "https://github.com/" .. maintainid .. "/" .. module
announcement     = ""
summary          = "A short introduction to LaTeX installation written in Chinese"
description      = [[
This package will introduce the operations related to installing TeX Live (introducing MacTeX in macOS), upgrading packages, and compiling simple documents on Windows 11, Ubuntu 22.04, and macOS systems, and mainly introducing command line operations.
]]

--[==========================================[--
            Pack and Upload To CTAN
         Don't Modify Unless Necessary
--]==========================================]--
ctanzip          = module
excludefiles     = {"*~"}
textfiles        = {"*.md", "LICENSE", "*.lua", "*.bat", "makefile"}
typesetexe       = "xelatex"
typesetfiles     = {module .. ".tex"}
typesetsuppfiles = {"*.tex"}
supportdir       = "chapter"

uploadconfig = {
  pkg          = module,
  version      = version,
  author       = maintainer,
  uploader     = uploader,
  email        = email,
  summary      = summary,
  description  = description,
  announcement = announcement,
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
function copyctan()
  local pkgdir = ctandir .. "/" .. ctanpkg
  mkdir(pkgdir)
  for _,main in pairs({module .. ".tex", module .. ".pdf"}) do
    cp(main, typesetdir, pkgdir)
  end
  local pkgsuppdir = ctandir .. "/" .. ctanpkg .. "/" .. supportdir
  mkdir(pkgsuppdir)
  for _,supptab in pairs(typesetsuppfiles) do
    cp(supptab, supportdir, pkgsuppdir)
  end
end