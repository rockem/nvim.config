local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  print("Failed to require 'gitsigns'")
  return 
end 

gitsigns.setup()
  
