function! TTFZoom(delta)
python << EOF
import re
gfn = vim.eval("&gfn")
mat = re.compile("([a-zA-Z_: ]+)(\d+)")
mato = re.match(mat, gfn)
newsz = 0
if not mato:
	print ("Cannot handle current font: %s" % gfn)
else:
	newsz = int(mato.group(2)) + int(vim.eval('a:delta'))
	if newsz > 0:
		gfn = "%s%d" % ( mato.group(1), newsz)
		gfn = gfn.replace(' ', '\ ')
		vim.command("set gfn=" + gfn )
EOF
endfunction

nnoremap <C-MouseUp> :call TTFZoom(-1)<CR>
nnoremap <C-MouseDown> :call TTFZoom(1)<CR>
