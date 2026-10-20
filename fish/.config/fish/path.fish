# Prepend new items to path (if directory exists)
fish_add_path \
 "$GOBIN" \
 "/opt/homebrew/bin" \
 "/opt/homebrew/sbin" \
 "/usr/local/bin" \
 "/usr/local/sbin" \
 "/usr/bin" \
 "/bin" \
 "/usr/sbin" \
 "/sbin" \
 "$DOTFILES_DIR/bin" \
 "$HOME/bin" \
 "$HOME/.local/bin" \
 "$HOME/go/bin" \
 "$HOME/.cargo/bin" \
 "$HOME/.dotnet/tools"
