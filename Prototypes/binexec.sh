for script in *; do
  if [ -x "$script" ]; then
    ln -sf "$PWD/$script" "$PREFIX/bin/$script"
  fi
done
