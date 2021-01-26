" ============================================================
" oceanicnext
" Author: Mike Hartington
" ============================================================

let s:p = {"normal": {}, "inactive": {}, "insert": {}, "replace": {}, "visual": {}, "tabline": {} }

let s:status_red = "#e4002b"
let s:status_green ="#26A69A" 
let s:cos_status = "#546E7A"
let s:p.normal.left = [[["#ffffff", 15], ["#fe5000", 209]], [["#ffffff", 15], ["#00838F", 243]], [["#ffffff", 15], ["#a51890", 209]],[["#ffffff", 15], ["#ab7967", 137]],[["#ffffff", 15], ["#8D6E63", 13]],]
let s:p.normal.middle = [[["#ffffff", 15], ["#343d46", 237]]]
let s:p.normal.right = [[["#ffffff", 15], ["#006064", 243]], [["#ffffff", 15], ["#00796B", 243]], [["#ffffff", 15], [s:cos_status, 243]], [["#ffffff", 15], [s:cos_status,243]]]
let s:p.normal.error = [[["#ffffff", 15], ["#ec5f67", 203]]]
let s:p.normal.warning = [[["#ffffff", 15], ["#fac863", 221]]]

let s:p.inactive.left = [[["#d8dee9", 253], ["#f99157", 243]], [["#d8dee9", 253], ["#65737e", 237]]]
let s:p.inactive.middle = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.inactive.right = [[["#d8dee9", 253], ["#343d46", 237]], [["#d8dee9", 253], ["#65737e", 243]]]

let s:p.insert.left = [[["#ffffff", 15], ["#fe5000", 209]], [["#ffffff", 15], ["#65737e", 243]], [["#ffffff", 15], ["#a51890", 209]],[["#ffffff", 15], ["#ab7967", 137]],[["#ffffff", 15], ["#8D6E63", 13]],]
let s:p.insert.middle = [[["#ffffff", 15], ["#343d46", 237]]]
let s:p.insert.right = [[["#ffffff", 15], ["#006064", 243]], [["#ffffff", 15], ["#00796B", 243]], [["#ffffff", 15], [s:cos_status, 243]]]

let s:p.replace.left = [[["#ffffff", 15], ["#ec5f67", 203]], [["#ffffff", 15], ["#65737e", 243]]]
let s:p.replace.middle = [[["#ffffff", 15], ["#343d46", 237]]]
let s:p.replace.right = [[["#ffffff", 15], ["#65737e", 243]], [["#ffffff", 15], ["#ec5f67", 203]]]

let s:p.visual.left = [[["#ffffff", 15], ["#fe5000", 209]], [["#ffffff", 15], ["#65737e", 243]]]
let s:p.visual.middle = [[["#ffffff", 15], ["#343d46", 237]]]
let s:p.visual.right = [[["#ffffff", 15], ["#65737e", 243]], [["#ffffff", 15], ["#f99157", 209]]]

let s:p.tabline.left = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.tabline.tabsel = [[["#ffffff", 15], ["#65737e", 243]]]
let s:p.tabline.middle = [[["#65737e", 243], ["#343d46", 237]]]
let s:p.tabline.right = [[["#65737e", 243], ["#343d46", 237]]]

let g:lightline#colorscheme#oceanicnext#palette = lightline#colorscheme#flatten(s:p)
