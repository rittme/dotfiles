-- Bluetooth shutdown

require "string"

-- ~/.hammerspoon/init.lua
hs.application.enableSpotlightForNameSearches(true)

modifiers = {
    hyper = { "alt", "cmd", "ctrl", "shift"}
}

function checkBluetoothResult(rc, stderr, stderr)
    if rc ~= 0 then
        print(string.format("Unexpected result executing `blueutil`: rc=%d stderr=%s stdout=%s", rc, stderr, stdout))
    end
end

function bluetooth(power)
    print("Setting bluetooth to " .. power)
    local t = hs.task.new("/usr/local/bin/blueutil", checkBluetoothResult, {"--power", power})
    t:start()
end

function f(event)
    if event == hs.caffeinate.watcher.systemWillSleep then
        bluetooth("off")
    elseif event == hs.caffeinate.watcher.screensDidWake then
        bluetooth("on")
    end
end

watcher = hs.caffeinate.watcher.new(f)
watcher:start()

-- App launcher

modifiers = {
  hyper = { "alt", "cmd", "ctrl", "shift"}
}

-- function to launch app or focus if already open
function launchApp(basicKey, object)
  hs.hotkey.bind(basicKey, object.key, function() 
      hs.application.launchOrFocus(object.app)
      local application = hs.application.get(object.app)
      if application ~= nil then  
          local window = application:focusedWindow()
      end
  end)
end

hs.fnutils.each({
  { key = "t", app = "iTerm" },
  { key = "v", app = "Visual Studio Code - Insiders" },
  { key = "m", app = "Spotify" },
  { key = "f", app = "Firefox" },
  { key = "p", app = "1Password 7"},
  { key = "w", app = "WhatsApp"},
  { key = "/", app = "Finder" },
  { key = ";", app = "Preview" }
}, function(object)
  launchApp(modifiers.hyper, object)
end)

hs.loadSpoon("Lunette")
spoon.Lunette:bindHotkeys()