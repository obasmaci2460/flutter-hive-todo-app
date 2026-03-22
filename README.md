# 📝 Flutter Task Manager with Hive

A fast, offline-first to-do application built with Flutter. This project demonstrates clean architecture, efficient local storage, and dynamic multi-language support.

<details>
<summary><b>🇹🇷 Türkçe Açıklama İçin Tıklayın</b></summary>
<br>

Flutter ile geliştirilmiş, hızlı ve öncelikli olarak çevrimdışı (offline-first) çalışan bir not defteri uygulamasıdır. Bu proje; temiz mimari prensiplerini, verimli yerel veri depolamayı ve dinamik çoklu dil desteğini göstermektedir.

</details>

## 🚀 Key Features

* **Offline Storage:** Secure and fast data persistence using the NoSQL database, Hive.
* **Localization:** Native language switching (English & Turkish) for a personalized user experience.
* **Dependency Injection:** Clean and scalable service locator pattern using GetIt.
* **Real-time Search:** Instant filtering of tasks with customized empty states.
* **Swipe Actions:** Intuitive swipe-to-delete interactions.

<details>
<summary><b>🇹🇷 Temel Özellikler (Türkçe)</b></summary>
<br>

* **Çevrimdışı Depolama:** NoSQL tabanlı Hive veritabanı ile güvenli ve hızlı veri kalıcılığı.
* **Dil Desteği:** Kullanıcı deneyimini kişiselleştiren yerel dil geçişi (İngilizce & Türkçe).
* **Bağımlılık Enjeksiyonu:** GetIt ile temiz ve ölçeklenebilir bir servis konumlandırıcı deseni.
* **Gerçek Zamanlı Arama:** Özelleştirilmiş boş durum uuyarılarıyla anlık görev filtreleme.
* **Kaydırma Eylemleri:** Sezgisel kaydırarak silme etkileşimleri.

</details>

## 🛠️ Tech Stack & Architecture

* **Framework:** Flutter
* **Database:** [Hive](https://pub.dev/packages/hive)
* **Architecture:** Modular structure with Separation of Concerns (`models`, `pages`, `services`, `widgets`)
* **State & Services:** [GetIt](https://pub.dev/packages/get_it)
* **Localization:** [easy_localization](https://pub.dev/packages/easy_localization)

## 📸 Screenshots & Localization Preview

The UI natively adapts to both English and Turkish, showcasing the dynamic localization capability.

| 1. Main Dashboard (English UI) | 2. Adding a Task (Turkish UI) |
|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/3134a8cd-a773-416c-a04b-02282d0dc7ab" width="250"> | <img src="https://github.com/user-attachments/assets/662b6919-89e7-4b3f-92f3-0edb40185e05" width="250"> |
| *Clean UI showing pending and completed tasks.* | *Dynamic localization during task entry.* |

| 3. Time Picker (Turkish UI) | 4. Search Functionality (English UI) |
|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/38a5248d-7fab-48fe-ba85-10f859f6d96d" width="250"> | <img src="https://github.com/user-attachments/assets/265bbdd1-7145-41fc-ae37-8422436a8c38" width="250"> |
| *Native time selection dialog adapted to the locale.* | *Real-time filtering with localized empty states.* |

## 💡 How to Run / Nasıl Çalıştırılır

1. **Clone the repository / Repoyu klonlayın:**
```bash
git clone [https://github.com/obasm/flutter-hive-todo-app.git](https://github.com/obasm/flutter-hive-todo-app.git)
