local M = {}

function M.setup()
	-- plugins.ai-avante
	vim.api.nvim_set_hl(0, "AvanteTitle", { link = "VertSplit" })
	vim.api.nvim_set_hl(0, "AvanteStateSpinnerThinking", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteStateSpinnerSearching", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteStateSpinnerSucceeded", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteSidebarNormal", { link = "Normal" })
	vim.api.nvim_set_hl(0, "AvanteSidebarWinSeparator", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteStateSpinnerToolCalling", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteStateSpinnerGenerating", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteReversedNormal", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteCommentFg", { link = "SpecialComment" })
	vim.api.nvim_set_hl(0, "AvanteSidebarWinHorizontalSeparator", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteReversedTitle", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvantePromptInput", { link = "String" })
	vim.api.nvim_set_hl(0, "AvanteReversedThirdTitle", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteThirdTitle", { link = "VertSplit" })
	vim.api.nvim_set_hl(0, "AvanteButtonDanger", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteButtonPrimaryHover", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteReversedSubtitle", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteSubtitle", { link = "VertSplit" })
	vim.api.nvim_set_hl(0, "AvanteButtonDefaultHover", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteButtonDefault", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteConfirmTitle", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteToBeDeletedWOStrikethrough", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteToBeDeleted", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteInlineHint", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvantePopupHint", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteAnnotation", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteSuggestion", { link = "Conditional" })
	vim.api.nvim_set_hl(0, "AvanteThinking", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteButtonPrimary", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteTaskCompleted", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteButtonDangerHover", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvantePromptInputBorder", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteStateSpinnerCompacting", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteStateSpinnerFailed", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteConflictCurrent", { link = "String" })
	vim.api.nvim_set_hl(0, "AvanteConflictIncoming", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteConflictCurrentLabel", { link = "Comment" })
	vim.api.nvim_set_hl(0, "AvanteConflictIncomingLabel", { link = "Comment" })
	-- noice.nvim
	vim.api.nvim_set_hl(0, "NotifyERRORBorder", { link = "ErrorMsg" })
	vim.api.nvim_set_hl(0, "NotifyERRORIcon", { link = "ErrorMsg" })
	vim.api.nvim_set_hl(0, "NotifyERRORTitle", { link = "ErrorMsg" })
	vim.api.nvim_set_hl(0, "NotifyWARNBorder", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "NotifyWARNTitle", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "NotifyWARNIcon", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "NotifyWARNTitle8", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "NotifyWARNBorder8", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "NotifyWARNBody8", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "NotifyWARNIcon8", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NotifyTRACETitle", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { link = "Debug" })
	vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { link = "Debug" })
	vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { link = "Debug" })
	vim.api.nvim_set_hl(0, "NotifyINFOIcon", { link = "Comment" })
	vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "Comment" })
	vim.api.nvim_set_hl(0, "NotifyINFOTitle", { link = "Comment" })
	-- "NotifyERRORBorder"       xxx guifg=#8a1f1f
	-- "NotifyWARNBorder"       xxx guifg=#79491d
	-- "NotifyINFOBorder"       xxx guifg=#4f6752
	-- "NotifyDEBUGBorder"       xxx guifg=#8b8b8b
	-- "NotifyTRACEBorder"       xxx guifg=#4f3552
	-- "NotifyERRORIcon"       xxx guifg=#f70067
	-- "NotifyWARNIcon"       xxx guifg=#f79000
	-- "NotifyINFOIcon"       xxx guifg=#a9ff68
	-- "NotifyDEBUGIcon"       xxx guifg=#8b8b8b
	-- "NotifyTRACEIcon"       xxx guifg=#d484ff
	-- "NotifyERRORTitle"       xxx guifg=#f70067
	-- "NotifyWARNTitle"       xxx guifg=#f79000
	-- "NotifyINFOTitle"       xxx guifg=#a9ff68
	-- "NotifyDEBUGTitle"       xxx guifg=#8b8b8b
	-- "NotifyTRACETitle"       xxx guifg=#d484ff
	-- "NotifyWARNTitle8"       xxx guifg=#f69000
	-- "NotifyWARNBorder8"       xxx guifg=#78491d
	-- "NotifyWARNBody8"       xxx guifg=#bac2ce guibg=#10141b
	-- "NotifyWARNIcon8"       xxx guifg=#f69000
	vim.api.nvim_set_hl(0, "NoiceCmdline", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconCalculator", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconCmdline", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconFilter", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconHelp", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconIncRename", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconInput", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconLua", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCalculator", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderFilter", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderHelp", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderIncRename", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderInput", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderLua", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePrompt", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindClass", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindColor", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindConstant", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindConstructor", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindDefault", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindEnum", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindEnumMember", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindField", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindFile", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindFolder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindFunction", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindInterface", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindKeyword", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindMethod", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindModule", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindProperty", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindSnippet", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindStruct", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindText", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindUnit", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindValue", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemKindVariable", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemMenu", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCompletionItemWord", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceConfirm", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceCursor", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatConfirm", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatConfirmDefault", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatDate", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatEvent", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatKind", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatLevelDebug", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatLevelError", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatLevelInfo", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatLevelOff", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatLevelTrace", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatLevelWarn", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatProgressDone", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatProgressTodo", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceFormatTitle", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceLspProgressClient", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceLspProgressSpinner", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceLspProgressTitle", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceMini", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoicePopup", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoicePopupBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoicePopupmenu", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoicePopupmenuMatch", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoicePopupmenuSelected", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceScrollbar", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceScrollbarThumb", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceSplit", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceSplitBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NoiceVirtualText", { link = "Normal" })

	-- for name, _ in pairs(vim.api.nvim_get_hl(0, {})) do
	-- 	if name:match("^Snacks") then
	-- 		vim.api.nvim_set_hl(0, name, { link = "Normal" })
	-- 	end
	-- end
	--
	-- for name, _ in pairs(vim.api.nvim_get_hl(0, {})) do
	-- 	if name:match("^Notify") then
	-- 		vim.api.nvim_set_hl(0, name, { link = "Normal" })
	-- 	end
	-- end
	--
end

return M
