# Proompty completion                                      -*- shell-script -*-

# This bash completions script was generated by
# completely (https://github.com/dannyben/completely)
# Modifying it manually is not recommended

_Proompty_completions_filter() {
  local words="$1"
  local cur=${COMP_WORDS[COMP_CWORD]}
  local result=()

  if [[ "${cur:0:1}" == "-" ]]; then
    echo "$words"
  
  else
    for word in $words; do
      [[ "${word:0:1}" != "-" ]] && result+=("$word")
    done

    echo "${result[*]}"

  fi
}

_Proompty_completions() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local compwords=("${COMP_WORDS[@]:1:$COMP_CWORD-1}")
  local compline="${compwords[*]}"

  case "$compline" in
    'get'*'--prefix-mod')
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/mods/ -type f | sed 's|'$PROOMPTY_DIR'/mods/||g')")" -- "$cur" )
      ;;

    'get'*'--suffix-mod')
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/mods/ -type f | sed 's|'$PROOMPTY_DIR'/mods/||g')")" -- "$cur" )
      ;;

    'add'*'--proompts')
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/proomplates/ -type f | sed 's|'$PROOMPTY_DIR/proomplates/||g')")" -- "$cur" )
      ;;

    'get'*'--prefix')
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/mods/ -type f | sed 's|'$PROOMPTY_DIR'/mods/||g')")" -- "$cur" )
      ;;

    'get'*'--suffix')
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/mods/ -type f | sed 's|'$PROOMPTY_DIR'/mods/||g')")" -- "$cur" )
      ;;

    'get'*'--pm')
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/mods/ -type f | sed 's|'$PROOMPTY_DIR'/mods/||g')")" -- "$cur" )
      ;;

    'get'*'--sm')
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/mods/ -type f | sed 's|'$PROOMPTY_DIR'/mods/||g')")" -- "$cur" )
      ;;

    'remove'*)
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/proomplates/ -type f | sed 's|'$PROOMPTY_DIR'/proomplates/||g')")" -- "$cur" )
      ;;

    'list'*)
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "--prompt-dir")" -- "$cur" )
      ;;

    'add'*)
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "--template-file --description --tags --template-content --set-var --set-var-value --prefix-mod --prefix --pm --suffix-mod --suffix --sm --proompts")" -- "$cur" )
      ;;

    'get'*)
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/proomplates/ -type f | sed 's|'$PROOMPTY_DIR'/proomplates/||g') --template-file --prefix-mod --prefix --pm -p --suffix-mod --suffix --sm -s --append --clip --no-clip --output --no-output")" -- "$cur" )
      ;;

    'set'*)
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "$(find $PROOMPTY_DIR/proomplates/ -type f | sed 's|'$PROOMPTY_DIR'/proomplates/||g')")" -- "$cur" )
      ;;

    *)
      while read -r; do COMPREPLY+=( "$REPLY" ); done < <( compgen -W "$(_Proompty_completions_filter "add get list remove set")" -- "$cur" )
      ;;

  esac
} &&
complete -F _Proompty_completions Proompty

# ex: filetype=sh
