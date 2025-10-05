function lt --description 'eza tree with optional level (default 1)'
  set -l level 1
  set -q argv[1]; and set level $argv[1]
  eza -a --tree --level=$level --icons=always $argv[2..-1]
end
