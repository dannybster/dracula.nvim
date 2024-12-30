---@class Highlight
---@variable.member fg string color name or "#RRGGBB"
---@variable.member foreground string same fg, color name or "#RRGGBB"
---@variable.member bg string color name or "#RRGGBB"
---@variable.member background string same bg, color name or "#RRGGBB"
---@variable.member sp string color name or "#RRGGBB"
---@variable.member special string same sg, color name or "#RRGGBB"
---@variable.member blend integer value between 0 and 100
---@variable.member bold boolean
---@variable.member standout boolean
---@variable.member underline boolean
---@variable.member undercurl boolean
---@variable.member underdouble boolean
---@variable.member underdotted boolean
---@variable.member underdashed boolean
---@variable.member strikethrough boolean
---@variable.member italic boolean
---@variable.member reverse boolean
---@variable.member nocombine boolean
---@variable.member link string name of another highlight group to link to, see |:hi-link|.
---@variable.member default string Don't override existing definition |:hi-default|
---@variable.member ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@variable.member ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@variable.member cterm table cterm attribute map, like |highlight-args|.

---@alias HighlightGroups table<string, Highlight>

---setup highlight groups
---@param configs DraculaConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
  local colors = configs.colors
  local endOfBuffer = {
    fg = configs.show_end_of_buffer and colors.visual or colors.bg,
  }

  return {
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg },
    Comment = { fg = colors.comment, italic = configs.italic_comment },
    Constant = { fg = colors.ansi_3 },
    String = { fg = colors.ansi_3 },
    Character = { fg = colors.ansi_2 },
    Number = { fg = colors.orange },
    Boolean = { fg = colors.ansi_6 },
    Float = { fg = colors.orange },
    FloatBorder = { fg = colors.ansi_7 },
    Operator = { fg = colors.ansi_4 },
    Keyword = { fg = colors.ansi_6 },
    Keywords = { fg = colors.ansi_6 },
    Identifier = { fg = colors.ansi_6 },
    Function = { fg = colors.ansi_3 },
    Statement = { fg = colors.ansi_4 },
    Conditional = { fg = colors.ansi_5 },
    Repeat = { fg = colors.ansi_5 },
    Label = { fg = colors.ansi_6 },
    Exception = { fg = colors.ansi_4 },
    PreProc = { fg = colors.ansi_3 },
    Include = { fg = colors.ansi_4 },
    Define = { fg = colors.ansi_4 },
    Title = { fg = colors.ansi_6 },
    Macro = { fg = colors.ansi_4 },
    PreCondit = { fg = colors.ansi_6 },
    Type = { fg = colors.ansi_6 },
    StorageClass = { fg = colors.ansi_5 },
    Structure = { fg = colors.ansi_3 },
    TypeDef = { fg = colors.ansi_3 },
    Special = { fg = colors.ansi_2, italic = true },
    SpecialComment = { fg = colors.comment, italic = true },
    Error = { fg = colors.ansi_9 },
    Todo = { fg = colors.ansi_4, bold = true, italic = true },
    Underlined = { fg = colors.ansi_6, underline = true },

    Cursor = { reverse = true },
    CursorLineNr = { fg = colors.fg, bold = true },

    SignColumn = { bg = colors.bg },

    Conceal = { fg = colors.comment },
    CursorColumn = { bg = colors.ansi_0 },
    CursorLine = { bg = colors.ansi_8 },
    ColorColumn = { bg = colors.ansi_8 },

    StatusLine = { fg = colors.ansi_7, bg = colors.ansi_0 },
    StatusLineNC = { fg = colors.comment },
    StatusLineTerm = { fg = colors.ansi_7, bg = colors.ansi_0 },
    StatusLineTermNC = { fg = colors.comment },

    Directory = { fg = colors.ansi_6 },
    DiffAdd = { fg = colors.bg, bg = colors.ansi_2 },
    DiffChange = { fg = colors.orange },
    DiffDelete = { fg = colors.ansi_1 },
    DiffText = { fg = colors.comment },

    ErrorMsg = { fg = colors.ansi_9 },
    VertSplit = { fg = colors.ansi_0 },
    WinSeparator = { fg = colors.ansi_0 },
    Folded = { fg = colors.comment },
    FoldColumn = {},
    Search = { fg = colors.ansi_0, bg = colors.orange },
    IncSearch = { fg = colors.orange, bg = colors.comment },
    LineNr = { fg = colors.comment },
    MatchParen = { fg = colors.fg, underline = true },
    NonText = { fg = colors.nontext },
    Pbg_dark = { fg = colors.ansi_7, bg = colors.bg_dark },
    PmenuSel = { fg = colors.ansi_7, bg = colors.ansi_8 },
    PmenuSbar = { bg = colors.bg },
    PmenuThumb = { bg = colors.ansi_8 },

    Question = { fg = colors.ansi_4 },
    QuickFixLine = { fg = colors.ansi_0, bg = colors.ansi_3 },
    SpecialKey = { fg = colors.nontext },

    SpellBad = { fg = colors.ansi_9, underline = true },
    SpellCap = { fg = colors.ansi_3 },
    SpellLocal = { fg = colors.ansi_3 },
    SpellRare = { fg = colors.ansi_3 },

    TabLine = { fg = colors.comment },
    TabLineSel = { fg = colors.ansi_7 },
    TabLineFill = { bg = colors.bg },
    Terminal = { fg = colors.ansi_7, bg = colors.ansi_0 },
    Visual = { bg = colors.visual },
    VisualNOS = { fg = colors.visual },
    WarningMsg = { fg = colors.ansi_3 },
    WildMenu = { fg = colors.ansi_0, bg = colors.ansi_7 },

    EndOfBuffer = endOfBuffer,

    -- TreeSitter
    ["@error"] = { fg = colors.ansi_9 },
    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@markup.list"] = { fg = colors.ansi_6 },

    ["@constant"] = { fg = colors.ansi_4 },
    ["@constant.builtin"] = { fg = colors.ansi_4 },
    ["@markup.link.label.symbol"] = { fg = colors.ansi_4 },

    ["@constant.macro"] = { fg = colors.ansi_6 },
    ["@string.regexp"] = { fg = colors.ansi_1 },
    ["@string"] = { fg = colors.ansi_3 },
    ["@string.escape"] = { fg = colors.ansi_6 },
    ["@string.special.symbol"] = { fg = colors.ansi_4 },
    ["@character"] = { fg = colors.ansi_2 },
    ["@number"] = { fg = colors.ansi_4 },
    ["@boolean"] = { fg = colors.ansi_4 },
    ["@number.float"] = { fg = colors.ansi_2 },
    ["@annotation"] = { fg = colors.ansi_3 },
    ["@attribute"] = { fg = colors.ansi_6 },
    ["@module"] = { fg = colors.orange },

    ["@function.builtin"] = { fg = colors.ansi_6 },
    ["@function"] = { fg = colors.ansi_2 },
    ["@function.macro"] = { fg = colors.ansi_2 },
    ["@variable.parameter"] = { fg = colors.orange },
    ["@variable.parameter.reference"] = { fg = colors.orange },
    ["@function.method"] = { fg = colors.ansi_2 },
    ["@variable.member"] = { fg = colors.orange },
    ["@property"] = { fg = colors.ansi_4 },
    ["@constructor"] = { fg = colors.ansi_6 },

    ["@keyword.conditional"] = { fg = colors.ansi_5 },
    ["@keyword.repeat"] = { fg = colors.ansi_5 },
    ["@label"] = { fg = colors.ansi_6 },

    ["@keyword"] = { fg = colors.ansi_5 },
    ["@keyword.function"] = { fg = colors.ansi_6 },
    ["@keyword.function.ruby"] = { fg = colors.ansi_5 },
    ["@keyword.operator"] = { fg = colors.ansi_5 },
    ["@operator"] = { fg = colors.ansi_5 },
    ["@keyword.exception"] = { fg = colors.ansi_4 },
    ["@type"] = { fg = colors.ansi_14 },
    ["@type.builtin"] = { fg = colors.ansi_6, italic = true },
    ["@type.qualifier"] = { fg = colors.ansi_5 },
    ["@structure"] = { fg = colors.ansi_4 },
    ["@keyword.include"] = { fg = colors.ansi_5 },

    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.ansi_4 },

    ["@markup"] = { fg = colors.orange },
    ["@markup.strong"] = { fg = colors.orange, bold = true }, -- bold
    ["@markup.emphasis"] = { fg = colors.ansi_3, italic = true }, -- italic
    ["@markup.underline"] = { fg = colors.orange },
    ["@markup.heading"] = { fg = colors.ansi_5, bold = true }, -- title
    ["@markup.raw"] = { fg = colors.ansi_3 }, -- inline code
    ["@markup.link.url"] = { fg = colors.ansi_3, italic = true }, -- urls
    ["@markup.link"] = { fg = colors.orange, bold = true },

    ["@tag"] = { fg = colors.ansi_6 },
    ["@tag.attribute"] = { fg = colors.ansi_2 },
    ["@tag.delimiter"] = { fg = colors.ansi_6 },

    -- Semantic
    ["@class"] = { fg = colors.ansi_6 },
    ["@struct"] = { fg = colors.ansi_6 },
    ["@enum"] = { fg = colors.ansi_6 },
    ["@enumMember"] = { fg = colors.ansi_4 },
    ["@event"] = { fg = colors.ansi_6 },
    ["@interface"] = { fg = colors.ansi_6 },
    ["@modifier"] = { fg = colors.ansi_6 },
    ["@regexp"] = { fg = colors.ansi_3 },
    ["@typeParameter"] = { fg = colors.ansi_6 },
    ["@decorator"] = { fg = colors.ansi_6 },

    -- LSP Semantic (0.9+)
    ["@lsp.type.class"] = { fg = colors.ansi_6 },
    ["@lsp.type.constructor"] = { fg = colors.ansi_6 },
    ["@lsp.type.enum"] = { fg = colors.ansi_6 },
    ["@lsp.type.decorator"] = { fg = colors.ansi_2 },
    ["@lsp.type.enumMember"] = { fg = colors.ansi_4 },
    ["@lsp.type.function"] = { fg = colors.ansi_2 },
    ["@lsp.type.interface"] = { fg = colors.ansi_6 },
    ["@lsp.type.macro"] = { fg = colors.ansi_6 },
    ["@lsp.type.method"] = { fg = colors.ansi_2 },
    ["@lsp.type.namespace"] = { fg = colors.orange },
    ["@lsp.type.parameter"] = { fg = colors.orange },
    ["@lsp.type.property"] = { fg = colors.ansi_4 },
    ["@lsp.type.struct"] = { fg = colors.ansi_6 },
    ["@lsp.type.type"] = { fg = colors.ansi_14 },
    ["@lsp.type.variable"] = { fg = colors.fg },

    -- HTML
    htmlArg = { fg = colors.ansi_2 },
    htmlBold = { fg = colors.ansi_3, bold = true },
    htmlEndTag = { fg = colors.ansi_6 },
    htmlH1 = { fg = colors.ansi_5 },
    htmlH2 = { fg = colors.ansi_5 },
    htmlH3 = { fg = colors.ansi_5 },
    htmlH4 = { fg = colors.ansi_5 },
    htmlH5 = { fg = colors.ansi_5 },
    htmlH6 = { fg = colors.ansi_5 },
    htmlItalic = { fg = colors.ansi_4, italic = true },
    htmlLink = { fg = colors.ansi_4, underline = true },
    htmlSpecialChar = { fg = colors.ansi_3 },
    htmlSpecialTagName = { fg = colors.ansi_6 },
    htmlTag = { fg = colors.ansi_6 },
    htmlTagN = { fg = colors.ansi_6 },
    htmlTagName = { fg = colors.ansi_6 },
    htmlTitle = { fg = colors.ansi_7 },

    -- Markdown
    markdownBlockquote = { fg = colors.ansi_3, italic = true },
    markdownBold = { fg = colors.orange, bold = true },
    markdownCode = { fg = colors.ansi_2 },
    markdownCodeBlock = { fg = colors.orange },
    markdownCodeDelimiter = { fg = colors.ansi_1 },
    markdownH2 = { link = "rainbow2" },
    markdownH1 = { link = "rainbow1" },
    markdownH3 = { link = "rainbow3" },
    markdownH4 = { link = "rainbow4" },
    markdownH5 = { link = "rainbow5" },
    markdownH6 = { link = "rainbow6" },
    markdownHeadingDelimiter = { fg = colors.ansi_1 },
    markdownHeadingRule = { fg = colors.comment },
    markdownId = { fg = colors.ansi_4 },
    markdownIdDeclaration = { fg = colors.ansi_6 },
    markdownIdDelimiter = { fg = colors.ansi_4 },
    markdownItalic = { fg = colors.ansi_3, italic = true },
    markdownLinkDelimiter = { fg = colors.ansi_4 },
    markdownLinkText = { fg = colors.ansi_5 },
    markdownListMarker = { fg = colors.ansi_6 },
    markdownOrderedListMarker = { fg = colors.ansi_1 },
    markdownRule = { fg = colors.comment },
    ["@markup.heading.1.markdown"] = { link = "rainbowcol1" },
    ["@markup.heading.2.markdown"] = { link = "rainbowcol2" },
    ["@markup.heading.3.markdown"] = { link = "rainbowcol3" },
    ["@markup.heading.4.markdown"] = { link = "rainbowcol4" },
    ["@markup.heading.5.markdown"] = { link = "rainbowcol5" },
    ["@markup.heading.6.markdown"] = { link = "rainbowcol6" },

    --  Diff
    diffAdded = { fg = colors.ansi_2 },
    diffRemoved = { fg = colors.ansi_1 },
    diffFileId = { fg = colors.ansi_3, bold = true, reverse = true },
    diffFile = { fg = colors.nontext },
    diffNewFile = { fg = colors.ansi_2 },
    diffOldFile = { fg = colors.ansi_1 },

    debugPc = { bg = colors.bg_dark },
    debugBreakpoint = { fg = colors.ansi_1, reverse = true },

    -- Git Signs
    GitSignsAdd = { fg = colors.ansi_10 },
    GitSignsChange = { fg = colors.ansi_6 },
    GitSignsDelete = { fg = colors.ansi_9 },
    GitSignsAddLn = { fg = colors.ansi_0, bg = colors.ansi_10 },
    GitSignsChangeLn = { fg = colors.ansi_0, bg = colors.ansi_6 },
    GitSignsDeleteLn = { fg = colors.ansi_0, bg = colors.ansi_9 },
    GitSignsCurrentLineBlame = { fg = colors.ansi_7 },

    -- Telescope
    TelescopePromptBorder = { fg = colors.comment },
    TelescopeResultsBorder = { fg = colors.comment },
    TelescopePreviewBorder = { fg = colors.comment },
    TelescopeSelection = { fg = colors.ansi_7, bg = colors.ansi_8 },
    TelescopeMultiSelection = { fg = colors.ansi_4, bg = colors.ansi_8 },
    TelescopeNormal = { fg = colors.fg, bg = colors.bg },
    TelescopeMatching = { fg = colors.ansi_2 },
    TelescopePromptPrefix = { fg = colors.ansi_4 },
    TelescopeResultsDiffDelete = { fg = colors.ansi_1 },
    TelescopeResultsDiffChange = { fg = colors.ansi_6 },
    TelescopeResultsDiffAdd = { fg = colors.ansi_2 },

    -- Flash
    FlashLabel = { bg = colors.ansi_1, fg = colors.ansi_15 },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg },
    NvimTreeRootFolder = { fg = colors.fg, bold = true },
    NvimTreeGitDirty = { fg = colors.ansi_3 },
    NvimTreeGitNew = { fg = colors.ansi_10 },
    NvimTreeImageFile = { fg = colors.ansi_5 },
    NvimTreeFolderIcon = { fg = colors.ansi_4 },
    NvimTreeIndentMarker = { fg = colors.nontext },
    NvimTreeEmptyFolderName = { fg = colors.comment },
    NvimTreeFolderName = { fg = colors.fg },
    NvimTreeSpecialFile = { fg = colors.ansi_5, underline = true },
    NvimTreeOpenedFolderName = { fg = colors.fg },
    NvimTreeCursorLine = { bg = colors.ansi_8 },
    NvimTreeIn = { bg = colors.ansi_8 },

    NvimTreeEndOfBuffer = endOfBuffer,

    -- NeoTree
    NeoTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NeoTreeNormalNC = { fg = colors.fg, bg = colors.bg_dark },
    NeoTreeDirectoryName = { fg = colors.fg },
    NeoTreeGitUnstaged = { fg = colors.ansi_13 },
    NeoTreeGitModified = { fg = colors.ansi_13 },
    NeoTreeGitUntracked = { fg = colors.ansi_10 },
    NeoTreeDirectoryIcon = { fg = colors.ansi_4 },
    NeoTreeIndentMarker = { fg = colors.nontext },
    NeoTreeDotfile = { fg = colors.comment },

    -- Bufferline
    BufferLineIndicatorSelected = { fg = colors.ansi_4 },
    BufferLineFill = { bg = colors.ansi_0 },
    BufferLineBufferSelected = { bg = colors.bg },
    BufferLineSeparator = { fg = colors.ansi_0 },

    -- LSP
    DiagnosticError = { fg = colors.ansi_1 },
    DiagnosticWarn = { fg = colors.ansi_3 },
    DiagnosticInfo = { fg = colors.ansi_6 },
    DiagnosticHint = { fg = colors.ansi_6 },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.ansi_1 },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.ansi_3 },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.ansi_6 },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.ansi_6 },
    DiagnosticSignError = { fg = colors.ansi_1 },
    DiagnosticSignWarn = { fg = colors.ansi_3 },
    DiagnosticSignInfo = { fg = colors.ansi_6 },
    DiagnosticSignHint = { fg = colors.ansi_6 },
    DiagnosticFloatingError = { fg = colors.ansi_1 },
    DiagnosticFloatingWarn = { fg = colors.ansi_3 },
    DiagnosticFloatingInfo = { fg = colors.ansi_6 },
    DiagnosticFloatingHint = { fg = colors.ansi_6 },
    DiagnosticVirtualTextError = { fg = colors.ansi_1 },
    DiagnosticVirtualTextWarn = { fg = colors.ansi_3 },
    DiagnosticVirtualTextInfo = { fg = colors.ansi_6 },
    DiagnosticVirtualTextHint = { fg = colors.ansi_6 },

    LspDiagnosticsDefaultError = { fg = colors.ansi_1 },
    LspDiagnosticsDefaultWarning = { fg = colors.ansi_3 },
    LspDiagnosticsDefaultInformation = { fg = colors.ansi_6 },
    LspDiagnosticsDefaultHint = { fg = colors.ansi_6 },
    LspDiagnosticsUnderlineError = { fg = colors.ansi_1, undercurl = true },
    LspDiagnosticsUnderlineWarning = { fg = colors.ansi_3, undercurl = true },
    LspDiagnosticsUnderlineInformation = { fg = colors.ansi_6, undercurl = true },
    LspDiagnosticsUnderlineHint = { fg = colors.ansi_6, undercurl = true },
    LspReferenceText = { fg = colors.orange },
    LspReferenceRead = { fg = colors.orange },
    LspReferenceWrite = { fg = colors.orange },
    LspCodeLens = { fg = colors.ansi_6 },
    LspInlayHint = { fg = "#969696", bg = "#2f3146" },

    --LSP Saga
    LspFloatWinNormal = { fg = colors.fg },
    LspFloatWinBorder = { fg = colors.comment },
    LspSagaHoverBorder = { fg = colors.comment },
    LspSagaSignatureHelpBorder = { fg = colors.comment },
    LspSagaCodeActionBorder = { fg = colors.comment },
    LspSagaDefPreviewBorder = { fg = colors.comment },
    LspLinesDiagBorder = { fg = colors.comment },
    LspSagaRenameBorder = { fg = colors.comment },
    LspSagaBorderTitle = { fg = colors.bg_dark },
    LSPSagaDiagnosticTruncateLine = { fg = colors.comment },
    LspSagaDiagnosticBorder = { fg = colors.comment },
    LspSagaShTruncateLine = { fg = colors.comment },
    LspSagaDocTruncateLine = { fg = colors.comment },
    LspSagaLspFinderBorder = { fg = colors.comment },
    CodeActionNumber = { bg = "NONE", fg = colors.ansi_6 },

    -- IndentBlankLine
    IndentBlanklineContextChar = { fg = colors.ansi_9, nocombine = true },

    -- Nvim compe
    CmpItemAbbrDeprecated = { fg = colors.ansi_7, bg = colors.bg },
    CmpItemAbbrMatch = { fg = colors.ansi_6, bg = colors.bg },

    -- barbar
    BufferVisibleTarget = { fg = colors.ansi_1 },
    BufferTabpages = { fg = colors.nontext, bg = colors.ansi_0, bold = true },
    BufferTabpageFill = { fg = colors.nontext, bg = colors.ansi_0 },
    BufferCurrentSign = { fg = colors.ansi_4 },
    BufferCurrentTarget = { fg = colors.ansi_1 },
    BufferInactive = { fg = colors.comment, bg = colors.ansi_0, italic = true },
    BufferInactiveIndex = { fg = colors.nontext, bg = colors.ansi_0, italic = true },
    BufferInactiveMod = { fg = colors.ansi_3, bg = colors.ansi_0, italic = true },
    BufferInactiveSign = { fg = colors.nontext, bg = colors.ansi_0, italic = true },
    BufferInactiveTarget = { fg = colors.ansi_1, bg = colors.ansi_0, bold = true },

    -- Compe
    CompeDocumentation = { link = "Pmenu" },
    CompeDocumentationBorder = { link = "Pmenu" },

    -- Cmp
    CmpItemAbbr = { fg = colors.ansi_7, bg = colors.bg },
    CmpItemKind = { fg = colors.ansi_7, bg = colors.bg },
    CmpItemKindMethod = { link = "@function.method" },
    CmpItemKindText = { link = "@markup" },
    CmpItemKindFunction = { link = "@function" },
    CmpItemKindConstructor = { link = "@type" },
    CmpItemKindVariable = { link = "@variable" },
    CmpItemKindClass = { link = "@type" },
    CmpItemKindInterface = { link = "@type" },
    CmpItemKindModule = { link = "@module" },
    CmpItemKindProperty = { link = "@property" },
    CmpItemKindOperator = { link = "@operator" },
    CmpItemKindReference = { link = "@variable.parameter.reference" },
    CmpItemKindUnit = { link = "@variable.member" },
    CmpItemKindValue = { link = "@variable.member" },
    CmpItemKindField = { link = "@variable.member" },
    CmpItemKindEnum = { link = "@variable.member" },
    CmpItemKindKeyword = { link = "@keyword" },
    CmpItemKindSnippet = { link = "@markup" },
    CmpItemKindColor = { link = "DevIconCss" },
    CmpItemKindFile = { link = "TSURI" },
    CmpItemKindFolder = { link = "TSURI" },
    CmpItemKindEvent = { link = "@constant" },
    CmpItemKindEnumMember = { link = "@variable.member" },
    CmpItemKindConstant = { link = "@constant" },
    CmpItemKindStruct = { link = "@structure" },
    CmpItemKindTypeParameter = { link = "@variable.parameter" },

    -- navic
    NavicIconsFile = { link = "CmpItemKindFile" },
    NavicIconsModule = { link = "CmpItemKindModule" },
    NavicIconsNamespace = { link = "CmpItemKindModule" },
    NavicIconsPackage = { link = "CmpItemKindModule" },
    NavicIconsClass = { link = "CmpItemKindClass" },
    NavicIconsMethod = { link = "CmpItemKindMethod" },
    NavicIconsProperty = { link = "CmpItemKindProperty" },
    NavicIconsField = { link = "CmpItemKindField" },
    NavicIconsConstructor = { link = "CmpItemKindConstructor" },
    NavicIconsEnum = { link = "CmpItemKindEnum" },
    NavicIconsInterface = { link = "CmpItemKindInterface" },
    NavicIconsFunction = { link = "CmpItemKindFunction" },
    NavicIconsVariable = { link = "CmpItemKindVariable" },
    NavicIconsConstant = { link = "CmpItemKindConstant" },
    NavicIconsString = { link = "String" },
    NavicIconsNumber = { link = "Number" },
    NavicIconsBoolean = { link = "Boolean" },
    NavicIconsArray = { link = "CmpItemKindClass" },
    NavicIconsObject = { link = "CmpItemKindClass" },
    NavicIconsKey = { link = "CmpItemKindKeyword" },
    NavicIconsKeyword = { link = "CmpItemKindKeyword" },
    NavicIconsNull = { fg = "blue" },
    NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
    NavicIconsStruct = { link = "CmpItemKindStruct" },
    NavicIconsEvent = { link = "CmpItemKindEvent" },
    NavicIconsOperator = { link = "CmpItemKindOperator" },
    NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
    NavicText = { fg = "gray" },
    NavicSeparator = { fg = "gray" },

    -- TS rainbow colors
    rainbowcol1 = { fg = colors.fg },
    rainbowcol2 = { fg = colors.ansi_5 },
    rainbowcol3 = { fg = colors.ansi_6 },
    rainbowcol4 = { fg = colors.ansi_2 },
    rainbowcol5 = { fg = colors.ansi_4 },
    rainbowcol6 = { fg = colors.orange },
    rainbowcol7 = { fg = colors.fg },

    -- Rainbow delimiter
    RainbowDelimiterRed = { fg = colors.fg },
    RainbowDelimiterYellow = { fg = colors.ansi_5 },
    RainbowDelimiterBlue = { fg = colors.ansi_6 },
    RainbowDelimiterOrange = { fg = colors.ansi_2 },
    RainbowDelimiterGreen = { fg = colors.ansi_4 },
    RainbowDelimiterViolet = { fg = colors.orange },
    RainbowDelimiterCyan = { fg = colors.fg },

    -- mini.indentscope
    MiniIndentscopeSymbol = { fg = "#B5629B" },
    MiniIndentscopeSymbolOff = { fg = "#B5629B" },

    -- mini.icons
    MiniIconsAzure = { fg = colors.ansi_14 },
    MiniIconsBlue = { fg = colors.ansi_12 },
    MiniIconsCyan = { fg = colors.ansi_6 },
    MiniIconsGrey = { fg = colors.ansi_7 },
    MiniIconsOrange = { fg = colors.orange },
    MiniIconsPurple = { fg = colors.ansi_4 },
    MiniIconsRed = { fg = colors.ansi_1 },
    MiniIconsYellow = { fg = colors.ansi_3 },

    -- goolord/alpha-nvim
    AlphaHeader = { fg = colors.ansi_4 },
    AlphaButtons = { fg = colors.ansi_6 },
    AlphaShortcut = { fg = colors.orange },
    AlphaFooter = { fg = colors.ansi_4, italic = true },

    -- nvimdev/dashboard-nvim
    DashboardShortCut = { fg = colors.ansi_6 },
    DashboardHeader = { fg = colors.ansi_4 },
    DashboardCenter = { fg = colors.fg },
    DashboardFooter = { fg = colors.ansi_4, italic = true },
    DashboardKey = { fg = colors.orange },
    DashboardDesc = { fg = colors.ansi_6 },
    DashboardIcon = { fg = colors.ansi_6, bold = true },

    -- dap UI
    DapUIPlayPause = { fg = colors.ansi_10 },
    DapUIRestart = { fg = colors.ansi_2 },
    DapUIStop = { fg = colors.ansi_1 },
    DapUIStepOver = { fg = colors.ansi_6 },
    DapUIStepInto = { fg = colors.ansi_6 },
    DapUIStepOut = { fg = colors.ansi_6 },
    DapUIStepBack = { fg = colors.ansi_6 },
    DapUIType = { fg = colors.ansi_12 },
    DapUIScope = { fg = colors.ansi_14 },
    DapUIModifiedValue = { fg = colors.ansi_14, bold = true },
    DapUIDecoration = { fg = colors.ansi_14 },
    DapUIThread = { fg = colors.ansi_10 },
    DapUIStoppedThread = { fg = colors.ansi_14 },
    DapUISource = { fg = colors.ansi_12 },
    DapUILineNumber = { fg = colors.ansi_14 },
    DapUIFloatBorder = { fg = colors.ansi_14 },
    DapUIWatchesEmpty = { fg = colors.ansi_5 },
    DapUIWatchesValue = { fg = colors.ansi_10 },
    DapUIWatchesError = { fg = colors.ansi_5 },
    DapUIBreakpointsPath = { fg = colors.ansi_14 },
    DapUIBreakpointsInfo = { fg = colors.ansi_10 },
    DapUIBreakpointsCurrentLine = { fg = colors.ansi_10, bold = true },
    DapStoppedLine = { default = true, link = "Visual" },
    DapUIWinSelect = { fg = colors.ansi_14, bold = true },

    -- Notify
    NotifyInfoIcon = { fg = colors.ansi_2 },
    NotifyInfoTitle = { fg = colors.ansi_2 },
    NotifyInfoBorder = { fg = "#2C453F" },
    NotifyErrorIcon = { fg = colors.ansi_1 },
    NotifyErrorTitle = { fg = colors.ansi_1 },
    NotifyErrorBorder = { fg = "#DD6E6B" },
    NotifyWarnIcon = { fg = colors.orange },
    NotifyWarnTitle = { fg = colors.orange },
    NotifyWarnBorder = { fg = "#785637" },
  }
end

return {
  setup = setup,
}
