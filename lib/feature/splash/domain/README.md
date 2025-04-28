# Domain Katmanı (Özellik: Splash)

Bu katman, uygulamanın "Splash" özelliğine ait iş mantığını (business logic) içerir ve kullanıcı arayüzü (UI) veya veri kaynaklarından (data sources) tamamen bağımsızdır. Temel amacı, uygulamanın bu özellikle ilgili ne _yaptığını_ tanımlamaktır.

## Alt Klasörler ve Amaçları:

- **`entity/` (veya `model/`):** Bu özelliğe ait temel iş nesnelerini temsil eden saf veri sınıfları. Dış katmanlardan veya UI detaylarından bağımsızdırlar.
- **`repository/`:** Bu özelliğe ait veri işlemlerini soyutlayan arayüzlerdir (abstract class).
- **`usecase/` (veya `interactor/`):** Bu özelliğe ait belirli bir iş akışını temsil eder. Repository arayüzlerini kullanarak iş mantığını orkestra eder.
