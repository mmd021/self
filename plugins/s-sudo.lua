do

function run(msg, matches)
local reply_id = msg['id']
local text = 'سلام باباجونم😋😊'
if matches[1] == 'سلام' or 'salam' then
    if is_sudo(msg) then
reply_msg(reply_id, text, ok_cb, false)
end
end 
end
return {
patterns = {
    "^سلام$",
    "^salam$"
},
run = run
}

end