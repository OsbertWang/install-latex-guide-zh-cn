--[==========================================[--
   L3BUILD FILE FOR INSTALL-LATEX-GUIDE-ZH-CN
--]==========================================]--

module           = "install-latex-guide-zh-cn"
maintainer       = "Ran Wang"
ctanzip          = module
typesetfiles     = {module .. ".tex"}
typesetexe       = "xelatex"
typesetopts      = "-interaction=nonstopmode -synctex=1"
supportdir       = "./chapter"
typesetsuppfiles = {"*.tex"}
textfiles        = {"*.md", "LICENSE"}

uploadconfig = {
  pkg          = module,
  version      = "v2025.4.1",
  author       = maintainer,
  uploader     = maintainer,
  email        = "ranwang.osbert@outlook.com",
  summary      = "A short introduction to LaTeX installation written in Chinese",
  description  = [[
    This package will introduce the operations related to installing TeX Live (introducing MacTeX in macOS), upgrading packages, and compiling simple documents on Windows 11, Ubuntu 22.04, and macOS systems, and mainly introducing command line operations.
  ]],
  announcement = "",
  license      = "lppl1.3c",  
  ctanPath     = "/info/install-latex-guide-zh-cn",
  home         = "https://github.com/osbertwang/" .. module,
  bugtracker   = "https://github.com/osbertwang/" .. module .. "/issues",
  repository   = "https://github.com/osbertwang/" .. module,
  development  = "https://github.com/osbertwang",
  update       = true
}

-- Copy files to the main CTAN release directory
function copyctan()
  local pkgsuppdir = ctandir .. "/" .. ctanpkg .. "/chapter"
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