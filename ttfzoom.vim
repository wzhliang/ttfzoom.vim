function! IncreaseFontSize()
python << EOF
import re
gfn=vim.eval("&gfn")
mat=re.compile("([a-zA-Z ]+)(\d+)")
mato = re.match( mat, gfn )
if not mato:
	print "Cannot handle current font: ", gfn
else:
	print "%s-%s" % (mato.group(1), mato.group(2))
	gfn = "%s%d" % ( mato.group(1), int(mato.group(2))+1)
	gfn = gfn.replace(' ', '\ ')
	vim.command("set gfn=" + gfn )
EOF
endfunction

function! DecreaseFontSize()
python << EOF
import re
gfn = vim.eval("&gfn")
mat=re.compile("([a-zA-Z ]+)(\d+)")
mato = re.match( mat, gfn )
if not mato:
	print "Cannot handle current font: ", gfn
else:
	print "%s-%s" % (mato.group(1), mato.group(2))
	if int(mato.group(2))-1 > 0:
	    gfn = "%s%d" % (mato.group(1),  int(mato.group(2))-1)
	    gfn = gfn.replace(' ', '\ ')
	    vim.command("set gfn=" + gfn )
EOF
endfunction

nnoremap <C-MouseUp> :call DecreaseFontSize()<CR>
nnoremap <C-MouseDown> :call IncreaseFontSize()<CR>
