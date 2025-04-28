# Presentation Katmanı (Özellik: Home)

Bu katman, "Home" özelliğinin kullanıcı tarafından görülen ve etkileşime girilen tüm bileşenlerini içerir. Domain katmanından aldığı veriyi kullanıcıya sunar ve kullanıcı etkileşimlerini alır.

## Alt Klasörler ve Amaçları:

- **`view/` (veya `screen/`, `page/`):** Kullanıcı arayüzünü oluşturan widget'lar (örn: `HomeView`, `PostDetailView`). Bu widget'lar genellikle state yönetimi mantığını içermez, sadece veriyi gösterir ve olayları ViewModel/Cubit/Bloc'a iletir.
- **`cubit/` (veya `viewmodel/`, `bloc/`):** View'ın durumunu (state) yöneten ve kullanıcı etkileşimlerine yanıt veren sınıflar (örn: `HomeCubit`). Domain katmanındaki usecase'leri çağırarak veriyi alır veya işlemleri tetikler. View'a gerekli veriyi ve durumu (loading, success, error) sağlar (`HomeState` gibi state sınıfları aracılığıyla).
- **`widget/` (Opsiyonel):** Sadece bu özelliğin view'larında kullanılan, tekrar kullanılabilir küçük UI bileşenleri (örn: `_buildCommentItem` gibi metotlar buraya taşınabilir).
