build:
	flatpak run --command=flatpak-builder org.flatpak.Builder --user --force-clean build-dir io.github.heathcliff26.go-minesweeper.yaml
	flatpak build-export export build-dir
	flatpak build-bundle export io.github.heathcliff26.go-minesweeper.flatpak io.github.heathcliff26.go-minesweeper

install: build
	flatpak install --user -y io.github.heathcliff26.go-minesweeper.flatpak

uninstall:
	flatpak uninstall --user -y io.github.heathcliff26.go-minesweeper

run: install
	flatpak run --user io.github.heathcliff26.go-minesweeper

lint:
	flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest io.github.heathcliff26.go-minesweeper.yaml

clean:
	rm -rf .flatpak-builder build-dir export *.flatpak
