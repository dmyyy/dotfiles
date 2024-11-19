-- Function to get formatted date and time for daily note path
local function get_formatted_date()
  -- Get current date and time
  local current_date = os.date("*t") -- returns a table with year, month, day, etc.

  -- Create formatted date strings
  local year = current_date.year
  local month = string.format("%02d", current_date.month)
  local day = string.format("%02d", current_date.day)

  -- Month names
  local month_names = {
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  }

  local month_name = month_names[current_date.month]

  -- Get day of the week
  local day_of_week = os.date("%A") -- Example: "Sunday"

  -- Create the file name and folder path
  local file_name = string.format("%d-%s-%s-%s", year, month, day, day_of_week)
  local folder_path = string.format("%d/%02d-%s", year, current_date.month, month_name)

  return folder_path, file_name
end

return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/obsidian-git-sync/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/obsidian-git-sync/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = function(_, opts)
    opts.workspaces = {
      {
        name = "personal",
        path = "~/obsidian-git-sync",
      },
    }

    local folder_path, file_name = get_formatted_date()
    opts.daily_notes = {
      folder = "Daily Notes/" .. folder_path,
      date_format = file_name,
      default_tags = { "daily_notes" },
      -- TODO: want to use some template for my daily notes
      template = nil,
    }
  end,
}
