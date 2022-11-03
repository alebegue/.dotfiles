local success, neogit = pcall(require, "neogit")
if not success then return end

neogit.setup({})
