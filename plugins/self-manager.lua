-- Checks if bot was disabled on specific chat
local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver)
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
		return "خاموش نیستم😌"
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return "روشن شدم🙂"
end

local function disable_channel( receiver )
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return "خاموشم کردی👋😑"
end

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If sender is moderator then re-enable the channel
	if is_sudo(msg) then
	  if msg.text == "/bot on" or msg.text == "/Bot on" or msg.text == "!bot on" or msg.text == "!Bot on" then
	  
	    enable_channel(receiver)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = ""
  end
-----------------------
         local autoleave = 'autoleave'
         local bot_id = our_id 
         local receiver = get_receiver(msg)
           if not redis:get(autoleave) then
    if msg.service and msg.action.type == "chat_add_user" and msg.action.user.id == tonumber(bot_id) and not is_sudo(msg) then
       send_large_msg(receiver, "بابام گفته گروه غریبه نرم😊👋", ok_cb, false)
       chat_del_user(receiver, 'user#id'..bot_id, ok_cb, false)
	   leave_channel(receiver, ok_cb, false)
    end
end
	return msg
end
-------------------
local function run(msg, matches)
	local receiver = get_receiver(msg)
	-- Enable a channel
	
	local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
    redis:incr(hash)
	if not is_sudo(msg) then
	return nil
	end
	if matches[1] == 'on' then
		return enable_channel(receiver)
	end
	-- Disable a channel
	if matches[1] == 'off' then
		return disable_channel(receiver)
	end
	           ---------------------
if matches[1] == 'helps'  then
    if msg.to.type == 'channel' or msg.to.type == 'chat' then
	local text = "⭕️➖!bot on - bot off(فعال سازی یا غیرفعال سازی ربات)\n⭕️➖!plist(نمایش لیست افزونه(پلاگین)\n⭕️➖!pl + (plugin name)(فعال سازی پلاگین(افزونه)\n⭕️➖!pl - (plugin name)(غیرفعال سازی پلاگین(افزونه)\n⭕️➖!reload(بازنگری و اعمال تغییرات افزونه ها) \n⭕️➖!pl - (name) chat (فعال سازی پلاگین-افزونه در گروه خاص)\n⭕️➖!pl + (name) chat (غیرفعال سازی پلاگین-افزونه در گروه خاص)\n⭕️➖!save (name) (by reply) ()\n ⭕️➖!dl plugin name(دانلود پلاگین-افزونه)\n⭕️➖!pvblock [username|id|reply] (مسدود سازی کاربر با یوزرنیم|شناسه|ریپلی)\n 🔴دستورات مدیریتی گروه👇\n ⭕️➖!setname (name)(تغییرات نام گروه)\n⭕️➖!link (دریافت لینک گروه) \n⭕️➖!newlink(دریافت لینک جدید) \n ⭕️➖!setlink [link](تنظیم لینک گروه)\n⭕️➖!tosuper (ارتقاء گروه به سوپرگروه)\n⭕️➖!setdes (text) (تنظیم درباره گروه)\n ⭕️➖!kick [username|id|reply](اخراج عضو با یوزرنیم|شناسه|ریپلی)\n ⭕️➖!inv [username|id|reply](دعوت عضو یا یوزرنیم|شناسه|ریپلی)\n⭕️➖!id @username (by reply) (دریافت شناسه فرد با دستور مقابل)\n⭕️➖!gpid (دریافت شناسه گروه)\n🔴فقط در سوپر گروه 👇 \n⭕️➖!silent [username|id|reply] (سایلنت کردن کاربر با یوزرنیم|شناسه|ریپلی)\n⭕️➖!unsilent [username|id|reply] (خارج کردن از حالت سایلنت کردن کاربر با یوزرنیم|شناسه|ریپلی)\n⭕️➖!silentlist(نمایش لیست افراد سایلنت شده) \n⭕️➖!clean silentlist(حذف افراد لیست سایلنت) \n ⭕️➖!mute all(فیلتر تمامی گفتگو ها)\n⭕️➖!unmute all(غیرفعا کردن فیلتر گفتگو ها) \n⭕️➖!mute status(بررسی وضعیت فعال بودن یا غیرفعال بودن فیلتر گفتگو ها) \n🔴دستورات سرگرمی👇 \n》!sticker (by reply)(تبدیل عکس به استیکر با ریپلی) \n》!photo (by reply) (تبدیل استیکر به عکس با ریپلی)\n》!tr fa-en word(مترجم) \n》!sticker name/word/emoji (تبدیل به استیکر|نام|شکلک و...)\n》!photo name/word/emoji(تبدیل به عکس|نام|شکلک و...) \n》!calc number +-*÷ (ماشین حساب)\n》!delplugin nameplugin(حذف پلاگین-افزونه) \n 》!weather city(دریافت وضعیت اب و هوای شهر مورد نظر)\n》!time(دریافت زمان) \n 》!voice text (تبدیل متن به صدا)\n》!clean msg number(حذف پیام های اخیر) \n> !autoleave on/off(فعال سازی یا غیرفعال سازی-خروج خودکار پس از اضافه کردن شما به گروه) \n > !antiflood on/off(فعال سازی یا غیرفعال سازی-حساسیت پیام مکرر)\n > !markread on|off(خوانده شدن خودکار پیام ها و غیرفعال کردن آن)\n > !pvsetflood(تنظیم پیام مکرر-حساسیت بر حسب تعداد پیام ارسالی)\n> !pvfloodtime(تنظیم پیام مکرر-حساسیت بر حسب زمان) \n > !pvblock(مسدود سازی کاربر)\n> !pvunblock(رفع مسدود سازی کاربر) "
 send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
			return "راهنما به پیویت فرستاده شد."
		end
end 
-----------------------
     if matches[1] == 'autoleave' and is_sudo(msg) then
local hash = 'autoleave'
--Enable Auto Leave
     if matches[2] == 'enable' then
    redis:del(hash)
   return 'Auto leave has been enabled'
--Disable Auto Leave
     elseif matches[2] == 'disable' then
    redis:set(hash, true)
   return 'Auto leave has been disabled'
--Auto Leave Status
      elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'Auto leave is enable'
       else
   return 'Auto leave is disable'
         end
      end
   end
end

return {
	description = "Plugin to manage channels. Enable or disable channel.", 
	usage = {
		"/channel enable: enable current channel",
		"/channel disable: disable current channel" },
	patterns = {
		"^[!/#](autoleave) (.*)$",
		"^[!/#](helps)$",
		"^[!/][Bb]ot (on)",
		"^[!/][Bb]ot (off)" }, 
	run = run,
	--privileged = true,
	moderated = true,
	pre_process = pre_process
}
