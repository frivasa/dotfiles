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
	-- undotree.nvim
	vim.api.nvim_set_hl(0, ".undotree_HighlightSyntaxAdd", { link = "Normal" })
	vim.api.nvim_set_hl(0, ".undotree_HighlightSyntaxChange", { link = "Normal" })
	vim.api.nvim_set_hl(0, ".undotree_HighlightSyntaxDel", { link = "Normal" })
	vim.api.nvim_set_hl(0, ".undotree_HighlightChangedWithSign", { link = "Normal" })
	vim.api.nvim_set_hl(0, ".undotree_HighlightChangedText", { link = "Normal" })
	-- plugins.other.flash
	vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "Comment" })
	vim.api.nvim_set_hl(0, "FlashMatch", { link = "Comment" })
	vim.api.nvim_set_hl(0, "FlashCurrent", { link = "Comment" })
	vim.api.nvim_set_hl(0, "FlashLabel", { link = "DiffChange" })
	vim.api.nvim_set_hl(0, "FlashPrompt", { link = "CurSearch" })
	vim.api.nvim_set_hl(0, "FlashPromptIcon", { link = "CurSearch" })
	-- vim.api.nvim_set_hl(0, "FlashCursor", { link = "Comment" })
end

return M
