# color scheme
set -l foreground f8f8f2
set -l selection  44475a
set -l comment    6272a4

set -l red    ff5555
set -l orange ffb86c
set -l yellow f4f99d
set -l green  50fa7b
set -l cyan   8be9fd
set -l pink   ff79c6
set -l purple bd93f9

set -g fish_color_autosuggestion $comment
set -g fish_color_command        $cyan
set -g fish_color_comment        $comment
set -g fish_color_end            $orange
set -g fish_color_error          $red
set -g fish_color_escape         $pink
set -g fish_color_normal         $foreground
set -g fish_color_operator       $green
set -g fish_color_param          $purple
set -g fish_color_quote          $yellow
set -g fish_color_redirection    $foreground
set -g fish_color_search_match   --background=$selection
set -g fish_color_selection      --background=$selection


# powerline-shell prompt
function fish_prompt
    powerline-shell --shell bare $status
end


# Custom aliases
alias llart='ls -lart'
alias t='terraform'
alias k='kubectl'
alias kc='kubectl config'
alias kg='kubectl config get-contexts'
alias ku='kubectl config use-context'
alias tinit='terraform init -backend-config="access_key=$AWS_ACCESS_KEY_ID" -backend-config="secret_key=$AWS_SECRET_ACCESS_KEY" -reconfigure'
alias tplan='source env.sh && terraform fmt && ../../contrib/scripts/pre-run/main.sh && terraform plan'
#alias tapply='source env.sh && terraform fmt && ~/src/isdin/tf_isdin_platform/contrib/scripts/pre-run/main.sh && terraform apply'
alias tapply='find ../.. -type f -name '\''*.tf'\'' -exec dirname {} \; | sort -u | xargs -I {} terraform fmt {} && source env.sh && terraform init -upgrade && terraform init -reconfigure && ../../contrib/scripts/pre-run/main.sh && terraform apply'

alias itlogin='\
  set environment (basename "$PWD") && \
  ~/src/isdin/tf_isdin_platform/contrib/scripts/configure-sso/check_aws_sso_profile.sh && \
  export AWS_PROFILE=terraform_isdin_$environment \
'
alias itplan='\
  set environment (basename "$PWD") && \
  ~/src/isdin/tf_isdin_platform/contrib/scripts/configure-sso/check_aws_sso_profile.sh && \
  export AWS_PROFILE=terraform_isdin_$environment && \
  find ~/src/isdin/tf_isdin_platform -type f -name "*.tf" -exec dirname {} \; | sort -u | xargs -I {} terraform fmt {} && \
  source env.sh && \
  terraform init -upgrade && \
  terraform init -reconfigure && \
  ~/src/isdin/tf_isdin_platform/contrib/scripts/pre-run/main.sh && \
  terraform plan && \
  ~/src/isdin/tf_isdin_platform/contrib/scripts/after-run/main.sh \
'

alias itapply='\
  set environment (basename "$PWD") && \
  ~/src/isdin/tf_isdin_platform/contrib/scripts/configure-sso/check_aws_sso_profile.sh && \
  export AWS_PROFILE=terraform_isdin_$environment && \
  find ~/src/isdin/tf_isdin_platform -type f -name "*.tf" -exec dirname {} \; | sort -u | xargs -I {} terraform fmt {} && \
  source env.sh && \
  terraform init -upgrade && \
  terraform init -reconfigure && \
  ~/src/isdin/tf_isdin_platform/contrib/scripts/pre-run/main.sh && \
  terraform apply && \
  ~/src/isdin/tf_isdin_platform/contrib/scripts/after-run/main.sh \
'


# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
