# Utility Katmanı

Bu klasör, uygulama genelinde kullanılan, herhangi bir özelliğe (feature) özel olmayan, tekrar kullanılabilir yardımcı programları ve temel yapılandırmaları içerir.

## Alt Klasörler ve Amaçları:

- **`dependency/`:** Bağımlılık yönetimi (Dependency Injection - GetIt) ile ilgili sınıflar (`DependencyManager`, `Dependencies`).
- **`router/`:** Uygulama içi sayfa yönlendirmesi (Navigation/Routing - GoRouter) yapılandırması (`AppRouter`).
- **`theme/`:** Uygulama teması (renkler, yazı tipleri, widget stilleri) tanımları (`AppTheme`).
- **`constants/`:** Uygulama genelinde kullanılan sabit değerler (API endpoint'leri, metinler, ikonlar - örn: `AppIcons`).
- **`extensions/`:** Mevcut sınıflara eklenen yardımcı metotlar (örn: `String` için doğrulama metotları, `DateTime` formatlama).
- **`mixin/`:** Farklı sınıflar arasında kod paylaşımı için kullanılan mixin'ler.
- **`service/`:** Ağ istekleri gibi dış servislerle iletişim için temel yapılar (soyutlamalar veya temel istemciler).
- **`helper/`:** Diğer kategorilere tam uymayan genel yardımcı fonksiyonlar veya sınıflar.
