# Presentation Katmanı (Özellik: Splash)

Bu katman, "Splash" özelliğinin kullanıcı tarafından görülen ve etkileşime girilen tüm bileşenlerini içerir. Domain katmanından aldığı veriyi kullanıcıya sunar ve kullanıcı etkileşimlerini alır.

## Alt Klasörler ve Amaçları:

- **`view/` (veya `screen/`, `page/`):** Kullanıcı arayüzünü oluşturan widget'lar (örn: `SplashView`).
- **`viewmodel/` (veya `cubit/`, `bloc/`):** View'ın durumunu yöneten ve kullanıcı etkileşimlerine yanıt veren sınıflar. Domain katmanındaki usecase'leri çağırır.
- **`widget/` (Opsiyonel):** Sadece bu özelliğin view'larında kullanılan, tekrar kullanılabilir küçük UI bileşenleri.
