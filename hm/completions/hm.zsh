if [[ ! -o interactive ]]; then
    return
fi

compctl -K _hm hm

_hm() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(hm commands)"
  else
    completions="$(hm completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
