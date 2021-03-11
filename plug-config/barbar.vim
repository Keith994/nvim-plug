" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:false

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable icons
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" If set, the icon color will follow its corresponding buffer
" highlight group. By default, the Buffer*Icon group is linked to the
" Buffer* group (see Highlighting below). Otherwise, it will take its
" default value as defined by devicons.
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = ''
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the maximum padding width with which to surround each tab
let bufferline.maximum_padding = 4

let bg_current = get(nvim_get_hl_by_name('Normal',     1), 'background', '#555555')
let bg_visible = get(nvim_get_hl_by_name('TabLineSel', 1), 'background', '#555555')
let bg_inactive = get(nvim_get_hl_by_name('TabLineFill',   1), 'background', '#111111')


" For buffers invisible buffers
hi default link BufferInactive     TabLineFill
hi default link BufferInactiveMod  TabLineFill
hi default link BufferInactiveSign TabLineFill
exe 'hi default BufferInactiveTarget   guifg=red gui=bold guibg=' . bg_inactive

hi default link BufferTabpageFill TabLineFill
hi default link BufferTabpages TabLineFill

