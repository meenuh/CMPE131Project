def kmp_search(s, w)
  s_local = s.clone
  w_local = w.clone
  s_local.downcase!
  w_local.downcase!
  m = 0
  i= 0
  slen = s_local.length
  wlen = w_local.length
  plen = 0
  while m < slen
    if w_local[i] == s_local[m]
      i += 1
      plen = [plen, i].max
      if i == wlen
        return plen
      end
    else
      i = 0
    end
    m += 1
  end
  return plen
end