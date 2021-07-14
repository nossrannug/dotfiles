-- Set hyper and reload on hyper+0
local hyper = { "cmd", "alt", "ctrl", "shift" }
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

local applicationHotkeys = {
  c = 'Google Chrome',
  a = 'iTerm', --iTerm
  s = 'Slack',
  b = 'Bear',
  v = 'Visual Studio Code',
  f = 'FireFox',
  q = 'Microsoft Teams',
  e = 'Microsoft Outlook',
  d = 'Postman',
  x = 'DBeaver',
  t = 'Microsoft To Do'
}
for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

-- Window management
hs.window.animationDuration = 0


hs.hotkey.bind(hyper, "z", function()
  hs.execute("displayplacer \"id:E5443D30-4EC6-1277-70DF-C64C9BA3CB5C res:1792x1120 hz:59 color_depth:4 scaling:on origin:(0,0) degree:0\" \"id:4CA6689A-8E7A-7C10-33DC-90B0BE271729 res:2560x1440 hz:59 color_depth:8 scaling:off origin:(0,-1440) degree:0\" \"id:48B8CE70-F7DD-155E-4696-3C6262236971 res:1440x2560 hz:59 color_depth:8 scaling:off origin:(-1440,-1733) degree:270\"", true);
end)
hs.hotkey.bind(hyper, "h", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.left50)
end)
hs.hotkey.bind(hyper, "j", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.maximized)
end)
hs.hotkey.bind(hyper, "k", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():next())
end)
hs.hotkey.bind(hyper, "l", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.right50)
end)