VERSION = "1.0.0"

local micro  = import("micro")
local config = import("micro/config")
local regexp = import("regexp")

function shouldIndent(bp)
   local regex = bp.Buf.Settings["indent.regex"]

   if regex == "" then
      return false
   end

   local line = bp.Buf:Line(bp.Cursor.Y):sub(1, bp.Cursor.X)

   local matched, err = regexp.MatchString(regex, line)

   if err ~= nil then
      micro.InfoBar():Error(err)
      return false
   end

   if not matched then
      return false
   end

   return true
end

function preInsertNewline(bp)
   if not shouldIndent(bp) then
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
