local function add_commit_push()
  local msg = H.fn.input('Commit message -> ', '')
  if msg == '' then
    print('Cancelled due to no commit message')
    return
  end
  H.cmd(':G aa')
  H.cmd(':G commit -m "' .. msg .. '"')
  H.cmd(':G push')
end

G.add_commit_push = add_commit_push

H.keymap('n', 'git', '<cmd>lua G.add_commit_push()<cr>')
