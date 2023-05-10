-- Spice up my pencil case. Defaults to velvety material.
function ColorMyPencils(color, materialStyle)
	color = color or "material"
	vim.cmd.colorscheme(color)
    materialStyle = materialStyle or "oceanic"
    vim.g.material_style = materialStyle


	vim.api.nvim_set_hl(0, "Normal", { bg= "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg= "none" })
end

ColorMyPencils()
