#!/usr/bin/env bash
#
# run-mac-intel.sh — zustand fork'unu Intel Mac'te kurar, test eder ve derler.
#
# DİKKAT: Bu bir KÜTÜPHANE deposudur, çalıştırılacak bir uygulama değil.
# Zustand'ı kendi projenizde kullanmak için bu depoya İHTİYACINIZ YOK:
#     npm install zustand
# Bu betik yalnızca kütüphanenin KENDİSİ üzerinde çalışacaksanız işe yarar.
# Bkz. DEPO-DURUMU.md
#
# Kullanım:  ./run-mac-intel.sh

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

BOLD="$(tput bold 2>/dev/null || true)"; RESET="$(tput sgr0 2>/dev/null || true)"
info() { echo "${BOLD}==>${RESET} $*"; }

echo "${BOLD}zustand${RESET} — pmndrs/zustand fork'u (bu depoda size ait kod yok)"
echo

if ! command -v node >/dev/null 2>&1; then
  echo "HATA: Node.js bulunamadı. Node 20+ kurun:" >&2
  echo "  https://nodejs.org  (Intel Mac için macOS x64 .pkg)" >&2
  echo "  veya: brew install node" >&2
  exit 1
fi
NODE_MAJOR="$(node -v | sed 's/^v//' | cut -d. -f1)"
if [ "$NODE_MAJOR" -lt 20 ]; then
  echo "HATA: Node $(node -v) bulundu, 20+ gerekiyor." >&2
  echo "  nvm kullanıyorsanız: nvm install 20 && nvm use 20" >&2
  exit 1
fi
info "Node $(node -v)"

if ! command -v pnpm >/dev/null 2>&1; then
  info "pnpm bulunamadı, corepack ile etkinleştiriliyor..."
  corepack enable >/dev/null 2>&1 || {
    echo "HATA: pnpm kurulamadı. Elle: npm install -g pnpm" >&2; exit 1; }
fi
info "pnpm $(pnpm -v)"

info "Bağımlılıklar kuruluyor (pnpm install)... birkaç dakika sürebilir"
pnpm install

info "Testler çalıştırılıyor (pnpm test)"
pnpm test

info "Derleniyor (pnpm build)"
pnpm build

echo
echo "${BOLD}Tamam.${RESET} Testler geçti ve kütüphane derlendi."
echo "Not: Burada çalıştırılacak bir 'uygulama' yok — bu bir kütüphane."
echo "Örnekleri denemek için: examples/ klasörüne bakın."
