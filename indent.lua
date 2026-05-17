VERSION = "1.0.0"

local micro  = import("micro")
local config = import("micro/config")
local regexp = import("regexp")

function preInsertNewline(bp)
   local regex = bp.Buf.Settings["indent.regex"]

   if regex == "" then
      return true
   end

   local line = bp.Buf:Line(bp.Cursor.Y)

   if bp.Cursor.X < #line then
      return true
   end

   local matched, err = regexp.MatchString(regex, line)

   if err ~= nil then
      micro.InfoBar():Error(err)
      return true
   end

   if not matched then
      return true
   end

   bp:InsertNewline()
   bp:IndentLine()

   return false
end

function preinit()
   config.RegisterCommonOption("indent", "regex", "")
   -- config.AddRuntimeFile("indent", config.RTHelp, "help/indent.md")
end
