# Yapılacaklar — yokbi/zustand

## Kod işi: **YOK**

Bu, `pmndrs/zustand` projesinin değiştirilmemiş bir fork'udur. Size ait tek
satır kod olmadığı için düzeltilecek hata, yazılacak test veya kapatılacak açık
da yoktur.

Aşağıdakiler **deponun kendisiyle** ilgilidir.

---

## Z1 🟢 Fork'un ne işe yaradığına karar verin

**Sorun:** Fork alınmış, hiç kullanılmamış. Depo listenizde kendi projelerinizin
arasında duruyor ve ilk bakışta "bu benim projem mi?" sorusunu doğuruyor.

**Seçenek A — Silin (önerilen).**
Kaybolacak hiçbir şey yok — kendi commit'iniz yok. Zustand'ı kullanmak için
fork gerekmiyor (`npm install zustand` yeter). İleride katkı vermek isterseniz
yeniden fork'lamak birkaç saniye sürer.

> GitHub → depo → **Settings** → *Danger Zone* → **Delete this repository**

**Seçenek B — Bırakın.** Zararı yok. Bu turda eklenen `DEPO-DURUMU.md`
sayesinde deponun ne olduğu artık ilk bakışta anlaşılıyor.

**Seçenek C — Gerçekten katkı verin.** Aklınızda bir düzeltme/özellik varsa:

```bash
git clone https://github.com/yokbi/zustand
cd zustand
git remote add upstream https://github.com/pmndrs/zustand
git fetch upstream && git merge upstream/main    # önce güncelleyin
git checkout -b fix/konu
# ... değişiklik ...
pnpm test
```

Sonra `pmndrs/zustand`'a PR açın. Kurallar: `CONTRIBUTING.md`.

---

## Z2 🟢 Fork güncel değil

Upstream aktif geliştiriliyor; bu fork alındığı andaki hâlinde duruyor.
Değişikliğiniz olmadığı için **çakışma riski yok** — güncellemek tek komut:

```bash
git remote add upstream https://github.com/pmndrs/zustand
git fetch upstream
git merge upstream/main
git push origin main
```

Z1-A seçilirse bu madde gereksiz.

---

## Not: upstream kodu denetlenmedi

Bu denetim **sizin işinizi** kapsıyor. Zustand'ın kendi kaynak kodundaki olası
hatalar, açıklar veya eksikler incelenmedi — o, upstream projenin sorumluluğunda
ve bakımlı bir projedir.
