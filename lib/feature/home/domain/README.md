# Domain Katmanı (Özellik: Home)

Bu katman, uygulamanın "Home" özelliğine ait iş mantığını (business logic) içerir ve kullanıcı arayüzü (UI) veya veri kaynaklarından (data sources) tamamen bağımsızdır. Temel amacı, uygulamanın bu özellikle ilgili ne _yaptığını_ tanımlamaktır.

## Alt Klasörler ve Amaçları:

- **`entity/` (veya `model/`):** Uygulamanın temel iş nesnelerini temsil eden saf veri sınıflarıdır (örn: `PostModel`, `CommentModel`). Dış katmanlardan (API yanıtları gibi) veya UI detaylarından bağımsızdırlar. Genellikle `Equatable` kullanarak değer eşitliği sağlarlar.
- **`repository/`:** Veri işlemlerini soyutlayan arayüzlerdir (abstract class). Verinin nereden (API, veritabanı, cache) veya nasıl alındığını gizlerler. Örneğin, `HomeRepository` arayüzü `getPosts()`, `getPostById(String id)` gibi metotlar tanımlar. Bu arayüzün somut uygulaması (concrete implementation) `data` katmanında (eğer varsa) veya doğrudan bu feature'ın `data` alt klasöründe bulunur.
- **`usecase/` (veya `interactor/`):** Uygulamanın belirli bir iş akışını veya kullanıcı senaryosunu temsil eder. Genellikle tek bir sorumluluğu vardır ve bir veya daha fazla repository arayüzünü kullanarak iş mantığını orkestra eder. Örneğin, `GetPostsUseCase` sınıfı, `HomeRepository`'yi kullanarak postları alır. `GetPostDetailUseCase` ise `HomeRepository`'den hem post detayını hem de yorumları alabilir. Presentation katmanı doğrudan repository'leri değil, usecase'leri kullanır.
