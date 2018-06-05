  call NERDTreeAddKeyMap({
        \ 'key': 'yy',
        \ 'callback': 'NERDTreeYankCurrentNode',
        \ 'quickhelpText': 'put full path of current node into the default register' })

  function! NERDTreeYankCurrentNode()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
      let path = substitute(n.path.str(), '\v^\s*([^ ]+)\s*$', '\1', '') 
      echo path
      call setreg('+', path)
    endif
  endfunction

