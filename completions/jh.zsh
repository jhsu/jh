if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jh jh

_jh() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(jh commands)"
  else
    completions="$(jh completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
