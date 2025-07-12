-- toggle-osd.lua
local showing = false
local timer = nil

function toggle_osd()
	if showing then
		mp.set_osd_ass(0, 0, "")
		showing = false
		if timer then
			timer:kill()
			timer = nil
		end
	else
		local text = mp.get_property_osd("osd-status")
		mp.set_osd_ass(0, 0, text)
		showing = true

		-- refresh every 1 second to keep info up-to-date
		timer = mp.add_periodic_timer(1, function()
			if showing then
				local update = mp.get_property_osd("osd-status")
				mp.set_osd_ass(0, 0, update)
			end
		end)
	end
end

mp.add_key_binding("i", "toggle-osd", toggle_osd)
