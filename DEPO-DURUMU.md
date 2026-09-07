# Depo Durumu — yokbi/zustand

> **Kök `README.md`'ye dokunulmadı.** O dosya upstream projesinin (pmndrs/zustand)
> resmî README'sidir; değiştirilirse upstream'den her `merge`'de çakışır.
> Bu dosya, **bu fork'un durumunu** anlatır.

**Denetim tarihi:** 2026-09-07 · **Varsayılan dal:** `main`

---

## 1. Tek cümleyle

Bu, [`pmndrs/zustand`](https://github.com/pmndrs/zustand) projesinin
**değiştirilmemiş bir fork'udur.** İçinde size ait tek satır kod yoktur.

---

## 2. Ölçüm — "değiştirilmemiş" iddiasının kanıtı

```
$ git log --all --format='%an|%ae|%s' | grep -icE 'yokbi|ozkaya|claude'
0
```

Depodaki **hiçbir commit** size ait değil. Tüm commit'ler upstream
katkıcılarına ait (Daishi Kato, Danilo Britto, Yurii Bezhentsev, …).

En son commit: `cda9d12 fix: updated the "Advanced Typescript Guide" link…` (#3294)
— bu da upstream'in kendi commit'i.

---

## 3. Zustand nedir (upstream projesi)

React için küçük, hızlı ve sade bir **durum yönetimi (state management)**
kütüphanesi. Redux'a kıyasla çok daha az kalıp kod (boilerplate) ister;
provider sarmalayıcısı gerektirmez.

```js
import { create } from 'zustand'

const useStore = create((set) => ({
  bears: 0,
  increase: () => set((s) => ({ bears: s.bears + 1 })),
}))

function Counter() {
  const bears = useStore((s) => s.bears)
  return <h1>{bears}</h1>
}
```

Ayrıntı ve kullanım: kökteki [`README.md`](README.md) (upstream dokümantasyonu).

---

## 4. Dal envanteri

| Dal | Durum |
|---|---|
| `main` | Varsayılan. Upstream'in `main` dalı, değiştirilmemiş. |
| `v4` | Upstream'in v4 bakım dalı. |
| `claude/repo-audit-docs-e1dail` | Bu doküman turu |

**Size ait iş içeren başka dal yoktur.** Yalnızca upstream'in iki dalı var.

---

## 5. Çalıştırma

Bu bir **kütüphane**, çalıştırılacak bir uygulama değil. Buradaki depoyu
çalıştırmanız pratikte gerekmez — kütüphaneyi kendi projenizde kullanmak
istiyorsanız fork'a hiç ihtiyacınız yok:

```bash
npm install zustand
```

Fork'un kendisi üzerinde geliştirme yapmak isterseniz (Node ≥ 20, pnpm):

```bash
./run-mac-intel.sh          # Intel Mac — kurulum + test + derleme
./run-mac-apple-silicon.sh
run-windows.bat
```

Betik `pnpm install` → `pnpm test` → `pnpm build` sırasını izler.
Ayrıntı: [`CONTRIBUTING.md`](CONTRIBUTING.md).

---

## 6. Bulgular

### 🟢 Z1 — Boş fork
Fork alınmış ama üzerinde hiç çalışılmamış. Muhtemelen kaynak koda göz atmak
veya bir katkı düşünmek için alındı, sonra bırakıldı.
→ `YAPILACAKLAR-DEPO.md` Z1

### 🟢 Z2 — Fork upstream'in gerisinde kalıyor
Değişikliğiniz olmadığı için bu bir risk değil; ama depo listenizde her geçen
gün daha eski bir kopya duruyor. → Z2

**Kod hatası, güvenlik açığı veya eksik iş bulgusu yoktur** — çünkü burada size
ait kod yok. Upstream'in kendi kodunu denetlemek bu turun kapsamı dışındadır.

---

## 7. Yarınki test için

**Burada test edilecek kendi işiniz yok.** Vaktinizi kendi projelerinize ayırın.

---

Kalan işler: [`YAPILACAKLAR-DEPO.md`](YAPILACAKLAR-DEPO.md)
