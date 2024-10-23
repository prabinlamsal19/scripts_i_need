for dir in */; do
  if [ -d "$dir" ]; then
    cd "$dir" || continue
    flutter pub get
    cd ..
  fi
done
