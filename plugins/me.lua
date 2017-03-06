do

local function run(msg, matches)
  if matches[1] == 'me' or 'من کیم' then
    if is_sudo(msg) then
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/sudo.webp', ok_cb, false)
      return "بابای خودمی😊"
    elseif is_admin1(msg) then
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/admin.webp', ok_cb, false)
      return "شما ادمین من هستید"
    elseif is_owner(msg) then
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/owner.webp', ok_cb, false)
      return "شما مدیر کل گروه هستید"
    elseif is_momod(msg) then
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/mod.webp', ok_cb, false)
      return "شما دستیار مدیر گروه هستید"
    else
    send_document(get_receiver(msg),'./sticker/'..msg.from.id..'.webp' or './sticker/member.webp', ok_cb, false)
      return "شما ممبر عادی هستید"
    end
  end
end

return {
  patterns = {
    "^[!/#]([Mm]e)$",
    "^([Mm]e)$",
    "^من کیم$"
    },
  run = run
}
end