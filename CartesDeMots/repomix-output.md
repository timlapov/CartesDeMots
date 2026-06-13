This file is a merged representation of the entire codebase, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of the entire repository's contents.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
Assets.xcassets/
  AccentColor.colorset/
    Contents.json
  AppIcon.appiconset/
    Contents.json
  bgAdd.imageset/
    4.jpg
    Contents.json
    l1.jpg
  bgLanguages.imageset/
    Contents.json
    photo-1571498664957-fde285d79857.jpeg
  bgLearn.imageset/
    3 (1).jpg
    Contents.json
    n4.jpg
  bgList.imageset/
    1 (2).jpg
    Contents.json
    n1.jpg
  bgListInverse.imageset/
    4421 (1).jpg
    Contents.json
    n3.jpg
  bgResources.imageset/
    5.jpg
    Contents.json
    n2.jpg
  bgSettings.imageset/
    4421.jpg
    Contents.json
    n3.jpg
  lechoix_icon.imageset/
    Contents.json
    Ouiounon-iOS-Default-1024x1024@1x.png
  motiwise_icon.imageset/
    Contents.json
    sdas-iOS-Default-1024x1024@1x.png
  Contents.json
en.lproj/
  Localizable.strings
fr.lproj/
  Localizable.strings
Model/
  Card.swift
  ModalHandler.swift
  Resource.swift
  Settings.swift
  Tab.swift
Preview Content/
  Preview Assets.xcassets/
    Contents.json
ru.lproj/
  Localizable.strings
Utilities/
  HapticManager.swift
View/
  CardItemView.swift
  CardsView.swift
  ContentView.swift
  FlagPickerView.swift
  GlassTextFieldView.swift
  GlassView.swift
  HowToUseView.swift
  LearnView.swift
  LongPressButtonView.swift
  MainTabView.swift
  MoreAppsView.swift
  NewLinkView.swift
  NewWordView.swift
  ResourceItemView.swift
  ResourcesView.swift
  SearchView.swift
  SettingsView.swift
  TabBarItemView.swift
ViewModel/
  CardsViewModel.swift
  LearnViewModel.swift
  ResourcesViewModel.swift
CartesDeMots.entitlements
CartesDeMotsApp.swift
CartesDeMotsRelease.entitlements
Info.plist
```

# Files

## File: Assets.xcassets/AccentColor.colorset/Contents.json
```json
{
  "colors" : [
    {
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/AppIcon.appiconset/Contents.json
```json
{
  "images" : [
    {
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "tinted"
        }
      ],
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/bgAdd.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "4.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "filename" : "l1.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/bgLanguages.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "photo-1571498664957-fde285d79857.jpeg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/bgLearn.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "3 (1).jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "filename" : "n4.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/bgList.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "1 (2).jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "filename" : "n1.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/bgListInverse.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "4421 (1).jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "filename" : "n3.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/bgResources.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "5.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "filename" : "n2.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/bgSettings.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "4421.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "filename" : "n3.jpg",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/lechoix_icon.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "Ouiounon-iOS-Default-1024x1024@1x.png",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/motiwise_icon.imageset/Contents.json
```json
{
  "images" : [
    {
      "filename" : "sdas-iOS-Default-1024x1024@1x.png",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: Assets.xcassets/Contents.json
```json
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: en.lproj/Localizable.strings
```
/* 
  Localizable.strings
  CartesDeMots

  Created by Timothée LAPOV on 07/07/2024.
  
*/

//MARK: TabBar
"tab_words" = "Words";
"tab_learn" = "Training";
"tab_resources" = "Resources";
"tab_settings" = "Settings";

//MARK: CardItemView
"Comment" = "Comment";
"Swipe to delete" = "Swipe to delete";

//MARK: CardsView
"Your list of words" = "Your list of words";

//MARK: NewWordView
"New word" = "New word";
"Foreign word" = "Foreign word (invisible side)";
"Translation" = "Translation (visible side)";
"Add the word" = "Add the word";

//MARK: LearnView
"Complexity %d" = "Complexity %d";
"Show word" = "Show word";
"Easy" = "Easy";
"Hard" = "Hard";
"No words available for learning" = "No words available for learning";

//MARK: ResourcesView
"Useful links" = "Useful links";

//MARK: NewLinkView
"New resource link" = "New resource link";
"Title" = "Title";
"Link" = "Link";
"Add the link" = "Add the link";

//MARK: SettingsView
"More Apps" = "More Apps";
"Settings" = "Settings";
"Language" = "Language";
"Enter language (emoji or name)" = "Enter language (emoji or name)";
"Startup Page" = "Startup Page";
"How to Use" = "How to Use";
"how_to_alert_text" = "Swipe to delete\nAll words sync between devices and are saved after reinstalling the app if you log in to the same iCloud account\nWords initially have the same rating, but it changes depending on whether the word is easy or difficult\nEasy words are shown less and less frequently, difficult ones - more often\nWords with zero rating are not shown";
"Got it" = "Got it";
"Write to developer" = "Suggest an Idea";
"Feedback" = "Feedback";
"Review on the App Store" = "Review on the App Store";
"General" = "General";
"System Settings" = "System Settings";
"Feedback for LexiSwipe app (v%@)" = "Feedback for LexiSwipe app (v%@)";
"emailBody" = "Hello,\n\nI'm writing from the LexiSwipe app.\n\nI want to report a bug:\n\nI want to suggest an idea:\n\n";

//MARK: HowToUseView
"howto_cards_title" = "Words";
"howto_cards_description" = "Add foreign words and their translations. Each card can include an optional comment for context or notes.\n\niOS 26+: Tap on a card to reveal action buttons — delete, edit, or reset difficulty.\n\niOS 18 and earlier: Swipe left on a card to delete it.";
"howto_learn_title" = "Training";
"howto_learn_description" = "Practice your vocabulary with flashcards. Tap to reveal the hidden word, then mark it as Easy or Hard — either by tapping the buttons or swiping the card left (Easy) or right (Hard).";
"howto_resources_title" = "Resources";
"howto_resources_description" = "Save useful links to language learning resources, dictionaries, or any helpful websites.\n\niOS 26+: Tap on a link to reveal the delete button.\n\niOS 18 and earlier: Swipe left to delete.";
"howto_gestures_title" = "iCloud Sync";
"howto_gestures_description" = "Your data syncs automatically via iCloud across all your devices.";
"howto_rating_title" = "Smart Rating System";
"howto_rating_description" = "Words start with the same rating. Easy words appear less often, hard words appear more frequently. Words with zero rating are hidden from training.\n\niOS 26+: You can reset a word's rating using the instructions above.";

//MARK: SearchView
"search_prompt_title" = "Search for Words";
"search_prompt_description" = "Enter a word, translation, or comment to search";
```

## File: fr.lproj/Localizable.strings
```
/* 
  Localizable.strings
  CartesDeMots

  Created by Timothée LAPOV on 07/07/2024.
  
*/
//MARK: TabBar
"tab_words" = "Mots";
"tab_learn" = "Apprentissage";
"tab_resources" = "Ressources";
"tab_settings" = "Paramètres";

//MARK: CardItemView
"Comment" = "Commentaire";
"Swipe to delete" = "Glissez pour supprimer";

//MARK: CardsView
"Your list of words" = "Votre liste de mots";

//MARK: NewWordView
"New word" = "Nouveau mot";
"Foreign word" = "Mot étranger (côté invisible)";
"Translation" = "Traduction (côté visible)";
"Add the word" = "Ajouter le mot";

//MARK: LearnView
"Complexity %d" = "Complexité %d";
"Show word" = "Afficher le mot";
"Easy" = "Facile";
"Hard" = "Difficile";
"No words available for learning" = "Aucun mot disponible pour l'apprentissage";

//MARK: ResourcesView
"Useful links" = "Liens utiles";

//MARK: NewLinkView
"New resource link" = "Nouveau lien de ressource";
"Title" = "Titre";
"Link" = "Lien";
"Add the link" = "Ajouter le lien";

//MARK: SettingsView
"More Apps" = "Autres apps";
"Settings" = "Réglages";
"Language" = "Langue";
"Enter language (emoji or name)" = "Entrez la langue (emoji ou nom)";
"Startup Page" = "Page de démarrage";
"How to Use" = "Guide d'utilisation";
"how_to_alert_text" = "Glissez pour supprimer\nTous les mots se synchronisent entre les appareils et sont sauvegardés après la réinstallation de l'application si vous vous connectez au même compte iCloud\nLes mots ont initialement la même note, mais elle change selon que le mot est facile ou difficile\nLes mots faciles sont montrés de moins en moins fréquemment, les difficiles - plus souvent\nLes mots dont le classement est nul ne sont pas affichés";
"Got it" = "J'ai compris";
"Write to developer" = "Proposer une idée";
"Feedback" = "Commentaires";
"Review on the App Store" = "Évaluer sur l'App Store";
"General" = "Général";
"System Settings" = "Réglages système";
"Feedback for LexiSwipe app (v%@)" = "Commentaires sur l'application LexiSwipe (v%@)";
"emailBody" = "Bonjour,\n\nJ'écris depuis l'application LexiSwipe.\n\nJe souhaite signaler un bug :\n\nJe souhaite suggérer une idée :\n\n";

//MARK: HowToUseView
"howto_cards_title" = "Mots";
"howto_cards_description" = "Ajoutez des mots étrangers et leurs traductions. Chaque carte peut inclure un commentaire facultatif pour le contexte ou des notes.\n\niOS 26+ : Appuyez sur une carte pour afficher les boutons d'action — supprimer, modifier ou réinitialiser la difficulté.\n\niOS 18 et antérieur : Glissez vers la gauche sur une carte pour la supprimer.";
"howto_learn_title" = "Apprentissage";
"howto_learn_description" = "Entraînez votre vocabulaire avec des cartes mémoire. Appuyez pour révéler le mot caché, puis marquez-le comme Facile ou Difficile — soit en appuyant sur les boutons, soit en glissant la carte vers la gauche (Facile) ou la droite (Difficile).";
"howto_resources_title" = "Ressources";
"howto_resources_description" = "Enregistrez des liens utiles vers des ressources d'apprentissage des langues, des dictionnaires ou tout autre site Web utile.\n\niOS 26+ : Appuyez sur un lien pour afficher le bouton de suppression.\n\niOS 18 et antérieur : Glissez vers la gauche pour supprimer.";
"howto_gestures_title" = "Synchronisation iCloud";
"howto_gestures_description" = "Vos données se synchronisent automatiquement via iCloud sur tous vos appareils.";
"howto_rating_title" = "Système de notation intelligent";
"howto_rating_description" = "Les mots commencent avec la même note. Les mots faciles apparaissent moins souvent, les mots difficiles plus fréquemment. Les mots avec une note nulle sont masqués de l'entraînement.\n\niOS 26+ : Vous pouvez réinitialiser la note d'un mot en suivant les instructions ci-dessus.";

//MARK: SearchView
"search_prompt_title" = "Rechercher des mots";
"search_prompt_description" = "Entrez un mot, une traduction ou un commentaire pour rechercher";
```

## File: Model/Card.swift
```swift
//
//  Card.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 23/05/2024.
//

import Foundation
import SwiftData

@Model
final class Card: Identifiable {
    var id: UUID?
    var foreignWord: String?
    var translation: String?
    var comment: String?
    var addDate: Date?
    var rating: Int?
    
    init(foreignWord: String, translation: String, comment: String) {
        self.id = UUID()
        self.foreignWord = foreignWord
        self.translation = translation
        self.comment = comment
        self.addDate = Date.now
        self.rating = 4
    }
}
```

## File: Model/ModalHandler.swift
```swift
//
//  ModalHandler.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import Foundation

struct ModalHandler: Identifiable {
    var id: String = UUID().uuidString
}
```

## File: Model/Resource.swift
```swift
//
//  Resource.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 30/06/2024.
//

import Foundation
import SwiftData

@Model
final class Resource: Identifiable {
    var id: UUID?
    var title: String?
    var link: String?
    var addDate: Date?
    
    init(title: String, link: String) {
        self.id = UUID()
        self.title = title
        self.link = link
        self.addDate = Date.now
    }
}
```

## File: Model/Settings.swift
```swift
//
//  Settings.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/07/2024.
//
//
import Foundation
import SwiftData

@Model
final class Settings {
    var language: String?
    var mainTabRawValue: String?
    var theme: String?
    var mode: String?
    var notificationsEnabled: Bool?
    var notificationFrequency: String?
    var dailyGoal: Int?
    var stat: Double?
    
    var mainTab: Tab {
        get { Tab(rawValue: mainTabRawValue ?? "words") ?? .words }
        set { mainTabRawValue = newValue.rawValue }
    }
    
    init(language: String?, mainTab: Tab?, theme: String?, notificationsEnabled: Bool?, notificationFrequency: String?, dailyGoal: Int?, stat: Double?) {
        self.language = "🏳️"
        self.mainTabRawValue = "words"
        self.theme = "default"
        self.mode = "system"
        self.notificationsEnabled = false
        self.notificationFrequency = "daily"
        self.dailyGoal = 20
        self.stat = 100.00
    }
}
```

## File: Model/Tab.swift
```swift
//
//  Tab.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import Foundation

enum Tab: String, CaseIterable {
    case words = "tab_words"
    case learn = "tab_learn"
    case resources = "tab_resources"
    case settings = "tab_settings"

    var image: String {
        switch self {
        case .words:
            "list.bullet.clipboard.fill"
        case .learn:
            "square.3.layers.3d.down.right"
        case .resources:
            "link.icloud"
        case .settings:
            "gear"
        }
    }

    var index: Int { Tab.allCases.firstIndex(of: self) ?? 0 }
    var localizedName: String {
        NSLocalizedString(rawValue, comment: "Tab name")
    }
}
```

## File: Preview Content/Preview Assets.xcassets/Contents.json
```json
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```

## File: ru.lproj/Localizable.strings
```
/* 
  Localizable.strings
  CartesDeMots

  Created by Timothée LAPOV on 07/07/2024.
  
*/
//MARK: TabBar
"tab_words" = "Слова";
"tab_learn" = "Тренировка";
"tab_resources" = "Ресурсы";
"tab_settings" = "Настройки";

//MARK: CardItemView
"Comment" = "Комментарий";
"Swipe to delete" = "Провести, чтобы удалить";

//MARK: CardsView
"Your list of words" = "Список слов";

//MARK: NewWordView
"New word" = "Новое слово";
"Foreign word" = "Иностранное слово (невидимая сторона)";
"Translation" = "Перевод (видимая сторона)";
"Add the word" = "Добавить слово";

//MARK: LearnView
"Complexity %d" = "Сложность %d";
"Show word" = "Показать слово";
"Easy" = "Легко";
"Hard" = "Сложно";
"No words available for learning" = "Нет слов для изучения";

//MARK: ResourcesView
"Useful links" = "Полезные ссылки";

//MARK: NewLinkView
"New resource link" = "Новая ссылка на ресурс";
"Title" = "Заголовок";
"Link" = "Ссылка";
"Add the link" = "Добавить ссылку";

//MARK: SettingsView
"More Apps" = "Другие приложения";
"Settings" = "Настройки";
"Language" = "Язык";
"Enter language (emoji or name)" = "Введите язык (эмодзи или название)";
"Startup Page" = "Стартовая страница";
"How to Use" = "Инструкция";
"how_to_alert_text" = "Смахните для удаления\nВсе слова синхронизируются между устройствами и сохраняются после переустановки приложения, если вы входите в тот же аккаунт iCloud\nИзначально все слова имеют одинаковый рейтинг, но он меняется в зависимости от того, легкое слово или сложное\nЛегкие слова показываются все реже, сложные - чаще\nСлова с нулевым рейтингом не показываются";
"Got it" = "Понятно";
"Write to developer" = "Предложить идею";
"Feedback" = "Обратная связь";
"Review on the App Store" = "Оценить в App Store";
"General" = "Основные";
"System Settings" = "Системные настройки";
"Feedback for LexiSwipe app (v%@)" = "Отзыв о приложении LexiSwipe (версия %@)";
"emailBody" = "Здравствуйте,\n\nЯ пишу из приложения LexiSwipe.\n\nЯ хочу сообщить об ошибке:\n\nЯ хочу предложить идею:\n\n";

//MARK: HowToUseView
"howto_cards_title" = "Слова";
"howto_cards_description" = "Добавляйте иностранные слова и их переводы. Каждая карточка может включать комментарий для контекста или заметок.\n\niOS 26+: Нажмите на карточку, чтобы появились кнопки действий — удаление, редактирование или сброс сложности.\n\niOS 18 и ранее: Смахните карточку влево для удаления.";
"howto_learn_title" = "Тренировка";
"howto_learn_description" = "Тренируйте словарный запас с помощью карточек. Нажмите, чтобы показать скрытое слово, затем отметьте его как Легко или Сложно — нажав на кнопку или смахнув карточку влево (Легко) или вправо (Сложно).";
"howto_resources_title" = "Ресурсы";
"howto_resources_description" = "Сохраняйте полезные ссылки на ресурсы для изучения языков, словари или любые полезные сайты.\n\niOS 26+: Нажмите на ссылку, чтобы появилась кнопка удаления.\n\niOS 18 и ранее: Смахните влево для удаления.";
"howto_gestures_title" = "Синхронизация iCloud";
"howto_gestures_description" = "Ваши данные автоматически синхронизируются через iCloud на всех ваших устройствах.";
"howto_rating_title" = "Умная система рейтинга";
"howto_rating_description" = "Слова начинают с одинакового рейтинга. Лёгкие слова появляются реже, сложные — чаще. Слова с нулевым рейтингом скрыты от тренировки.\n\niOS 26+: Вы можете сбросить рейтинг слова по инструкции выше.";

//MARK: SearchView
"search_prompt_title" = "Поиск карточек слов";
"search_prompt_description" = "Введите слово, перевод или комментарий для поиска";
```

## File: Utilities/HapticManager.swift
```swift
//
//  HapticManager.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/07/2024.
//

import Foundation
import SwiftUI

class HapticManager {
    static let shared = HapticManager() // Singleton
    
    private init() {} // Private initializer for singleton
    
    // Simple feedback
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impact = UIImpactFeedbackGenerator(style: style)
        impact.impactOccurred()
    }
    
    // Feedback notification
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(type)
    }
    
    // Feedback selection
    func selection() {
        let selection = UISelectionFeedbackGenerator()
        selection.selectionChanged()
    }
    
    // Feedback sequence
    func sequence() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            generator.notificationOccurred(.success)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let impact = UIImpactFeedbackGenerator(style: .light)
            impact.impactOccurred()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let impact = UIImpactFeedbackGenerator(style: .medium)
            impact.impactOccurred()
        }
    }
}

// View extension
extension View {
    func hapticImpact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        HapticManager.shared.impact(style: style)
    }
    
    func hapticNotification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        HapticManager.shared.notification(type: type)
    }
    
    func hapticSelection() {
        HapticManager.shared.selection()
    }
    
    func hapticSequence() {
        HapticManager.shared.sequence()
    }
}
```

## File: View/CardItemView.swift
```swift
//
//  CardItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI
import SwiftData

struct CardItemView: View {
    
    @State private var offsetX: CGFloat = 0
    @State private var isDragging = false
    @State private var initialTouchPoint: CGPoint?
    @GestureState private var dragState = false
    @State private var isExpanded = false
    
    var onDelete: ()->()
    var onEdit: (() -> Void)? = nil
    var onResetRating: (() -> Void)? = nil
    var card: Card
    var language: String
    
    var body: some View {
        if #available(iOS 26.0, *) {
            modernCardView()
        } else {
            legacyCardView()
        }
    }
    
    // MARK: - iOS 26+ Modern Design
    @available(iOS 26.0, *)
    private func modernCardView() -> some View {
        VStack(spacing: 0) {
            Button(action: {
                hapticSelection()
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    isExpanded.toggle()
                }
            }) {
                cardContent()
                    .blur(radius: isExpanded ? 8 : 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 20))
            .overlay {
                if isExpanded {
                    actionButtons()
                }
            }
            
        }
        .frame(maxWidth: .infinity)
    }
    
    @available(iOS 26.0, *)
    private func actionButtons() -> some View {
            // Удалить
        GlassEffectContainer {
            HStack(spacing: 10) {
                Button(action: {
                    hapticNotification(.warning)
                    withAnimation(.spring()) {
                        isExpanded = false
                        onDelete()
                    }
                }) {
                    Image(systemName: "trash.fill")
                        .font(.title2)
                        .bold()
                        .frame(width: 40, height: 40)
                }
                .buttonStyle(.glass)
                .tint(.red)
                
                // Редактировать
                if let onEdit = onEdit {
                    Button(action: {
                        hapticSelection()
                        withAnimation(.spring()) {
                            isExpanded = false
                        }
                        onEdit()
                    }) {
                        Image(systemName: "pencil")
                            .font(.title2)
                            .bold()
                            .frame(width: 40, height: 40)
                    }
                    .buttonStyle(.glass)
                    .tint(.blue)
                }
                
                // Сбросить рейтинг
                if let onResetRating = onResetRating {
                    Button(action: {
                        hapticNotification(.success)
                        withAnimation(.spring()) {
                            isExpanded = false
                        }
                        onResetRating()
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.title2)
                            .bold()
                            .frame(width: 40, height: 40)
                    }
                    .buttonStyle(.glass)
                    .tint(.orange)
                }
            }
        }
        }

    
    // MARK: - Legacy iOS Design (iOS 18 and below)
    private func legacyCardView() -> some View {
        ZStack(alignment: .trailing) {
            if offsetX < 0 {
                deleteBackground()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            
            cardContent()
                .background(cardBackground())
                .offset(x: offsetX)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 15)
                        .updating($dragState) { _, state, _ in
                            state = true
                        }
                        .onChanged { value in
                            if initialTouchPoint == nil {
                                initialTouchPoint = value.startLocation
                            }
                            
                            // Check if the drag is mostly horizontal
                            let dragDifference = value.location - (initialTouchPoint ?? .zero)
                            if abs(dragDifference.x) > abs(dragDifference.y) * 2 {
                                if !isDragging {
                                    hapticSelection()
                                    isDragging = true
                                }
                                withAnimation(.interactiveSpring()) {
                                    offsetX = min(0, value.translation.width)
                                }
                            }
                        }
                        .onEnded { value in
                            initialTouchPoint = nil
                            isDragging = false
                            
                            withAnimation(.spring()) {
                                if -offsetX > screenSize().width * 0.45 {
                                    offsetX = -screenSize().width
                                    hapticNotification(.warning)
                                    onDelete()
                                } else {
                                    offsetX = 0
                                }
                            }
                        }
                )
        }
        .frame(maxWidth: .infinity)
    }
    
    private func cardContent() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text(language)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(.all, 0)
            }
            Text(card.foreignWord ?? "")
                .padding(.top, 0)
                .font(.headline)
            Text(card.translation ?? "")
                .padding(.top, 1)
            
            if let comment = card.comment, !comment.isEmpty {
                Divider()
                Text("Comment")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(card.comment ?? "")
                    
            }
        }
        .padding()
    }
    
    private func cardBackground() -> some View {
        GlassView()
            .background(
                Color.white.opacity(0.2)
                    .overlay(
                        Color.red.opacity(offsetX < 0 ? -offsetX / screenSize().width * 0.5 : 0)
                    )
            )
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 7, x:  2, y: 2)
    }
    
    private func deleteBackground() -> some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "trash")
                    .font(.title)
                if -offsetX / screenSize().width > 0.3 {
                    Text("Swipe to delete")
                        .font(.caption)
                }
            }
            .foregroundColor(.white)
            .frame(width: -offsetX)
            .opacity(Double(-offsetX / 100))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.8))
    }
}

extension CGPoint {
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}
// MARK: - Preview

#Preview("Card with comment") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Card.self, configurations: config)
    
    let mockCard = Card(
        foreignWord: "Bonjour",
        translation: "Hello",
        comment: "A common French greeting used throughout the day"
    )
    
    return CardItemView(
        onDelete: {
            print("Delete tapped")
        },
        onEdit: {
            print("Edit tapped")
        },
        onResetRating: {
            print("Reset rating tapped")
        },
        card: mockCard,
        language: "🇫🇷"
    )
    .padding()
    .background {
        Image("bgList")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    .modelContainer(container)
}

#Preview("Card without comment") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Card.self, configurations: config)
    
    let mockCard = Card(
        foreignWord: "Merci",
        translation: "Thank you",
        comment: ""
    )
    
    return CardItemView(
        onDelete: {
            print("Delete tapped")
        },
        onEdit: {
            print("Edit tapped")
        },
        onResetRating: {
            print("Reset rating tapped")
        },
        card: mockCard,
        language: "🇫🇷"
    )
    .padding()
    .background {
        Image("bgList")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    .modelContainer(container)
}

#Preview("Multiple Cards") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Card.self, configurations: config)
    
    let mockCards = [
        Card(foreignWord: "Bonjour", translation: "Hello", comment: "A common French greeting"),
        Card(foreignWord: "Au revoir", translation: "Goodbye", comment: ""),
        Card(foreignWord: "S'il vous plaît", translation: "Please", comment: "Formal version of 'please'"),
        Card(foreignWord: "Merci beaucoup", translation: "Thank you very much", comment: "")
    ]
    
    return ScrollView {
        LazyVStack(spacing: 0) {
            ForEach(mockCards, id: \.id) { card in
                CardItemView(
                    onDelete: {
                        print("Delete tapped for \(card.foreignWord ?? "")")
                    },
                    onEdit: {
                        print("Edit tapped for \(card.foreignWord ?? "")")
                    },
                    onResetRating: {
                        print("Reset rating tapped for \(card.foreignWord ?? "")")
                    },
                    card: card,
                    language: "🇫🇷"
                )
                .padding(.horizontal)
                .padding(.top, 7)
            }
        }
    }
    .background {
        Image("bgList")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    .modelContainer(container)
}
```

## File: View/CardsView.swift
```swift
//
//  CardsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI
import SwiftData

struct CardsView: View {
    @Query(sort: [SortDescriptor(\Card.addDate, order: .reverse)], animation: .default) private var cards: [Card]
    @Query private var settings: [Settings]

    @Environment(\.modelContext) private var modelContext

    @State private var language: String = "🏳️"

    @StateObject var cardsViewModel = CardsViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Your list of words")
                    .font(.title)
                    .fontDesign(.rounded)
                    .bold()
                Spacer()
                if #available(iOS 26, *) {
                    Button(action: {
                        hapticSelection()
                        cardsViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .padding(3)
                    })
                    .buttonStyle(.glassProminent)
                    .tint(Color(.orange))
                } else {
                    Button(action: {
                        hapticSelection()
                        cardsViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(7)
                            .background {
                                Circle()
                                    .fill(.orange)
                                    .opacity(0.95)
                            }
                    })
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, -7)

            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(spacing: 0) {
                    ForEach(cards) { card in
                        CardItemView(
                            onDelete: {
                                withAnimation(.spring()) {
                                    modelContext.delete(card)
                                }
                            },
                            onEdit: {
                                cardsViewModel.editCardHandler = (card: card, handler: ModalHandler())
                            },
                            onResetRating: {
                                card.rating = 4
                            },
                            card: card,
                            language: language
                        )
                        .padding(.horizontal)
                        .padding(.top, 7)
                    }
                }
                .padding(.bottom, 100)
            }
            .scrollContentBackground(.hidden)
            .scrollDismissesKeyboard(.immediately)
            .scrollIndicators(.visible)
        }
        .background {
            Image("bgList")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .ignoresSafeArea(edges: .bottom)
        .sheet(item: $cardsViewModel.addViewHandler) {_ in
            NewWordView(cardsViewModel: cardsViewModel)
        }
        .sheet(item: Binding(
            get: { cardsViewModel.editCardHandler?.handler },
            set: { newValue in
                if newValue == nil {
                    cardsViewModel.editCardHandler = nil
                }
            }
        )) { _ in
            if let editCard = cardsViewModel.editCardHandler?.card {
                NewWordView(cardsViewModel: cardsViewModel, existingCard: editCard)
            }
        }
        .onAppear {
            loadLanguageSetting()
        }
    }
    
    private func loadLanguageSetting() {
        if let firstSettings = settings.first {
            language = firstSettings.language ?? "🏳️"
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Card.self, Resource.self, Settings.self])
}

extension View {
    func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}
```

## File: View/ContentView.swift
```swift
//
//  ContentView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            MainTabView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Card.self, Resource.self, Settings.self])
}
```

## File: View/FlagPickerView.swift
```swift
//
//  FlagPickerView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import Foundation
import SwiftUI

struct FlagPickerView: View {
    let flags = ["🇬🇧", "🇪🇸", "🇫🇷", "🇩🇪", "🇵🇹", "🏳️", "🇷🇺", "🇨🇳", "🇸🇦", "🇯🇵", "🇮🇳"]
    @State private var selectedFlag = "🏳️"

    var body: some View {
        VStack {
            Picker("Choose your flag", selection: $selectedFlag) {
                ForEach(flags, id: \.self) { flag in
                    Text(flag).tag(flag)
                }
            }
            .pickerStyle(.palette)
            .padding()
        }
    }
}

#Preview {
    FlagPickerView()
}
```

## File: View/GlassTextFieldView.swift
```swift
//
//  GlassTextFieldView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct GlassTextFieldView: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        if #available(iOS 26, *) {
            TextField(placeholder, text: $text)
                .padding()
                .glassEffect(in: .capsule)
                .padding(.top, 20)
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .background {
                    GlassView()
                        .background(.white.opacity(0.4))
                }
                .cornerRadius(10)
                .padding(.top, 30)
        }
    }
    

}

#Preview {
    GlassTextFieldView(text: .constant(""), placeholder: "placeholder")
}
```

## File: View/GlassView.swift
```swift
//
//  GlassView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 07/05/2024.
//

import Foundation
import SwiftUI

struct GlassView: UIViewRepresentable {
    var removeAllFilters = false
    
    func makeUIView(context: Context) -> some UIView {
        if #available(iOS 26, *) {
            // Используем UIGlassEffect для iOS 26 - новый Liquid Glass
            let glassEffect = UIGlassEffect()
            glassEffect.isInteractive = true
            let view = UIVisualEffectView(effect: glassEffect)
            return view
        } else {
            // Используем старый UIBlurEffect для iOS < 26
            let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
            return view
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if #available(iOS 26, *) {
            // Для iOS 26 с UIGlassEffect фильтры не нужны
            return
        } else {
            // Для старых версий применяем фильтры
            DispatchQueue.main.async {
                if let backdropLayer = uiView.layer.sublayers?.first {
                    if removeAllFilters {
                        backdropLayer.filters = []
                    } else {
                        backdropLayer.filters?.removeAll(where: { filter in
                            String(describing: filter) != "gaussianBlur"})
                    }
                }
            }
        }
    }
}
```

## File: View/HowToUseView.swift
```swift
//
//  HowToUseView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/01/2026.
//

import SwiftUI

struct HowToUseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                instructionSection(
                    icon: "square.2.layers.3d",
                    title: NSLocalizedString("howto_cards_title", comment: ""),
                    description: NSLocalizedString("howto_cards_description", comment: "")
                )

                instructionSection(
                    icon: "square.3.layers.3d.down.right",
                    title: NSLocalizedString("howto_learn_title", comment: ""),
                    description: NSLocalizedString("howto_learn_description", comment: "")
                )

                instructionSection(
                    icon: "link.icloud",
                    title: NSLocalizedString("howto_resources_title", comment: ""),
                    description: NSLocalizedString("howto_resources_description", comment: "")
                )

                instructionSection(
                    icon: "icloud",
                    title: NSLocalizedString("howto_gestures_title", comment: ""),
                    description: NSLocalizedString("howto_gestures_description", comment: "")
                )

                instructionSection(
                    icon: "star",
                    title: NSLocalizedString("howto_rating_title", comment: ""),
                    description: NSLocalizedString("howto_rating_description", comment: "")
                )
            }
            .padding()
        }
        .navigationTitle("How to Use")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func instructionSection(icon: String, title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: icon)
                .font(.headline)

            Text(description)
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        HowToUseView()
    }
}
```

## File: View/LearnView.swift
```swift
//
//  CardsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI
import SwiftData
import Pow

struct LearnView: View {
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var viewModel = LearnViewModel()
    
    @Query private var settings: [Settings]
    
    @State private var offset: CGFloat = 0
    @State private var backgroundColor: Color = .clear
    @State private var isCardVisible = true
    @State private var language: String = "🏳️"
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            // Background
            Image("bgLearn")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Content
            VStack {
                if let card = viewModel.currentCard {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.red.opacity(0.7))
                            .frame(height: screenHeight * 0.45)
                            .cornerRadius(20)
                            .overlay(
                                Image(systemName: "bolt.heart")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .opacity(offset > 0 ? min(offset / 50, 1.0) : 0)
                            )
                            .opacity(offset > 0 ? 1 : 0)
                        
                        Rectangle()
                            .fill(Color.green.opacity(0.7))
                            .frame(height: screenHeight * 0.45)
                            .cornerRadius(20)
                            .overlay(
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .opacity(offset < 0 ? min(-offset / 50, 1.0) : 0)
                                
                            )
                            .opacity(offset < 0 ? 1 : 0)
                        
                        // Card
                        if isCardVisible {
                            VStack(alignment: .center) {
                                HStack {
                                    Text(String(format: NSLocalizedString("Complexity %d", comment: "Complexity rating"), card.rating ?? 1))
                                        .foregroundStyle(.gray)
                                        .padding()
                                    Spacer()
                                    Text(language)
                                        .font(.title3)
                                        .foregroundStyle(.gray)
                                        .padding()
                                    //Text("\(String(card.rating ?? -1)) offset: \(offset)")
                                }
                                Text(card.translation ?? "")
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                                if viewModel.translationIsShown {
                                    Text(card.foreignWord ?? "")
                                        .font(.title2)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(.gray)
                                        .padding()
                                } else {
                                    Spacer()
                                    Button(action: {
                                        withAnimation {
                                            viewModel.showTranslation()
                                            hapticSequence()
                                        }
                                    }) {
                                        if #available(iOS 26.0, *) {
                                            Text("Show word")
                                                .bold()
                                                .padding()
                                                .glassEffect(in: .capsule)
                                        } else {
                                            Text("Show word")
                                                .foregroundColor(.white)
                                                .padding()
                                                .background {
                                                    GlassView()
                                                    Color.orange.opacity(0.9)
                                                }
                                                .cornerRadius(10)
                                        }
                                    }
                                    .transition(.movingParts.vanish(.orange))
                                    .conditionalEffect(.repeat(.shake(rate: .fast), every: .seconds(3)), condition: true)
                                }
                                
                                if viewModel.translationIsShown {
                                    Spacer()
                                }
                                
                                // Buttons Easy and Hard
                                HStack {
                                    Button(action: {
                                        hapticImpact()
                                        viewModel.updateRatingAndNextCard(isEasy: true)
                                    }) {
                                        HStack {
                                            Image(systemName: "arrow.left")
                                            Text("Easy")
                                        }
                                        .foregroundColor(.green)
                                        .frame(maxWidth: .infinity)
                                    }
                                    
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.5))
                                        .frame(width: 1, height: 30)
                                    
                                    Button(action: {
                                        hapticImpact()
                                        viewModel.updateRatingAndNextCard(isEasy: false)
                                    }) {
                                        HStack {
                                            Text("Hard")
                                            Image(systemName: "arrow.right")
                                        }
                                        .foregroundColor(.red)
                                        .frame(maxWidth: .infinity)
                                    }
                                }
                                .padding(.vertical, 10)
                            }
                            .frame(height: screenHeight * 0.45)
                            .frame(maxWidth: .infinity)
                            .background(GlassView())
                            .cornerRadius(20)
                            .compositingGroup()
                            .shadow(color: .gray.opacity(0.2), radius: 20)
                            .offset(x: offset)
                            .rotationEffect(.degrees(Double(offset) / 20))
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        offset = gesture.translation.width
                                    }
                                    .onEnded { _ in
                                        if abs(offset) > 140 {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                offset = offset > 0 ? screenWidth : -screenWidth
                                                hapticImpact()
                                                isCardVisible = false
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                viewModel.updateRatingAndNextCard(isEasy: offset < 0)
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    offset = 0
                                                    isCardVisible = true
                                                }
                                            }
                                        } else {
                                            withAnimation {
                                                offset = 0
                                            }
                                        }
                                    }
                            )
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing).combined(with: .opacity),
                                removal: .move(edge: offset > 0 ? .trailing : .leading).combined(with: .opacity)
                            ))
                        }
                    }
                    
                    Spacer()
                } else {
                    Spacer()
                    Text("No words available for learning")
                        .foregroundStyle(.gray)
                        .padding()
                    Spacer()
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.setModelContext(modelContext)
            loadLanguageSetting()
        }
    }
    
    private func loadLanguageSetting() {
        if let firstSettings = settings.first {
            language = firstSettings.language ?? "🏳️"
        }
    }
}

#Preview {
    LearnView()
        .modelContainer(for: [Card.self, Resource.self, Settings.self])
}
```

## File: View/LongPressButtonView.swift
```swift
//
//  LongPressButtonView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 01/02/2025.
//
import SwiftUI

struct LongPressButton: View {
    @State private var progress: CGFloat = 0

    let image: Image
    var backgroundColor = Color.clear
    var foregroundColor = Color.primary
    var strokeColor = Color.red
    var strokeWidth: CGFloat = 6
    var action: () -> Void

    var body: some View {
        image
            .font(.title)
            .foregroundColor(foregroundColor)
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
            .padding()
            .background(
                Circle().fill(backgroundColor)
            )
            .overlay(
                Circle()
                    .rotation(Angle(degrees: -90))
                    .trim(from: 0, to: progress)
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
            )
            .onLongPressGesture(minimumDuration: 0.6, pressing: { isPressing in
                if isPressing {
                    // Начинаем анимировать заполнение круга до 1 за 0.5 секунд
                    withAnimation(.linear(duration: 0.6)) {
                        self.progress = 1
                    }
                } else {
                    // Если пользователь отпускает до истечения времени, сбрасываем прогресс
                    self.progress = 0
                }
            }, perform: {
                // Когда длительное нажатие успешно завершилось, выполняем действие
                action()
                // Сбрасываем прогресс, чтобы круг исчез
                self.progress = 0
            })
    }
}


#Preview {
    LongPressButton(image: Image(systemName: "trash"), action: { print("Long pressed!") })
}
```

## File: View/MainTabView.swift
```swift
//
//  MainTabView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI
import SwiftData

struct MainTabView: View {

    @Query private var settings: [Settings]

    @State private var activeTab = Tab.words
    @State private var searchText = ""

    init() {
        if #unavailable(iOS 26) {
            UITabBar.appearance().isHidden = true
        }
    }

    var body: some View {
        Group {
            if #available(iOS 26, *) {
                modernTabView
            } else {
                legacyTabView
            }
        }
        .onAppear {
            if let firstSettings = settings.first {
                activeTab = firstSettings.mainTab
            }
        }
    }

    // MARK: - iOS 26+ (LiquidGlass)
    @available(iOS 26, *)
    private var modernTabView: some View {
        TabView {
            SwiftUI.Tab(Tab.words.localizedName, systemImage: Tab.words.image) {
                CardsView()
            }

            SwiftUI.Tab(Tab.learn.localizedName, systemImage: Tab.learn.image) {
                LearnView()
            }

            SwiftUI.Tab(Tab.resources.localizedName, systemImage: Tab.resources.image) {
                ResourcesView()
            }

            SwiftUI.Tab(Tab.settings.localizedName, systemImage: Tab.settings.image) {
                SettingsView()
            }

            SwiftUI.Tab(NSLocalizedString("tab_search", comment: ""), systemImage: "magnifyingglass", role: .search) {
                NavigationStack {
                    SearchView(searchText: $searchText)
                        //.navigationTitle(NSLocalizedString("tab_search", comment: ""))
                }
                .searchable(text: $searchText)
            }
            
        }
        .tint(.orange)
        .tabBarMinimizeBehavior(.onScrollDown)
    }

    // MARK: - iOS 18 and earlier (Custom TabBar)
    private var legacyTabView: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab,
                        content:  {
                    CardsView()
                        .tag(Tab.words)
                    LearnView()
                        .tag(Tab.learn)
                    ResourcesView()
                        .tag(Tab.resources)
                    SettingsView()
                        .tag(Tab.settings)
                })

            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    TabBarItemView(tab: tab, activeTab: $activeTab)
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                GlassView()
                    .clipShape(Capsule())
                    .padding(.horizontal)
                Capsule()
                    .foregroundColor(.gray.opacity(0.2))
                    .shadow(radius: 7)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Card.self, Resource.self, Settings.self])
}
```

## File: View/MoreAppsView.swift
```swift
//
//  MoreAppsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/01/2026.
//


import SwiftUI

struct MoreAppsView: View {

    private let apps: [AppInfo] = [
        AppInfo(
            name: "The Choice: yes or no",
            //description: NSLocalizedString("the-choice-description", comment: ""),
            appStoreID: "6475051206",
            iconName: "lechoix_icon"
        ),
        AppInfo(
            name: "MotiWise: AI-coach",
            //description: NSLocalizedString("the-choice-description", comment: ""),
            appStoreID: "6745251400",
            iconName: "motiwise_icon"
        )
    ]

    var body: some View {
        List(apps) { app in
            Button {
                openAppStore(appID: app.appStoreID)
            } label: {
                HStack(spacing: 16) {
                    // App Icon
                    if let iconImage = UIImage(named: app.iconName) {
                        Image(uiImage: iconImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    } else {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.secondary.opacity(0.3))
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image(systemName: "app")
                                    .font(.title)
                                    .foregroundStyle(.secondary)
                            }
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(app.name)
                            .font(.headline)
                            .foregroundStyle(.primary)
//                        Text(app.description)
//                            .font(.subheadline)
//                            .foregroundStyle(.secondary)
//                            .lineLimit(2)
                    }

                    Spacer()

                    Image(systemName: "arrow.up.right")
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("More Apps")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func openAppStore(appID: String) {
        if let url = URL(string: "https://apps.apple.com/app/id\(appID)") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - App Info Model
struct AppInfo: Identifiable {
    let id = UUID()
    let name: String
    //let description: String
    let appStoreID: String
    let iconName: String
}

#Preview {
    NavigationStack {
        MoreAppsView()
    }
}
```

## File: View/NewLinkView.swift
```swift
//
//  NewLinkView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct NewLinkView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var resourcesViewModel: ResourcesViewModel
    @State var title = ""
    @State var link = "https://"
    
    private var isButtonDisabled: Bool {
        title.count < 2 || link.count < 2 ? true : false
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Text("New resource link")
                Spacer()
                if #available(iOS 26.0, *) {
                    Button(action: {
                        hapticSelection()
                        resourcesViewModel.addViewHandler = nil
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.orange)
                    })
                    .buttonStyle(.glass)
                } else {
                    Button(action: {
                        hapticSelection()
                        resourcesViewModel.addViewHandler = nil
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.orange)
                    })
                    .buttonStyle(.borderless)
                }
            }
            .font(.title)
            .bold()
            .fontDesign(.rounded)
            
            Spacer()
            
            GlassTextFieldView(text: $title, placeholder: NSLocalizedString("Title", comment: "linkTitle"))
            
            GlassTextFieldView(text: $link, placeholder: NSLocalizedString("Link", comment: "link"))
            
            Button(action: {
                let resource = Resource(title: title, link: link)
                modelContext.insert(resource)
                hapticNotification(.success)
                resourcesViewModel.addViewHandler = nil
            }, label: {
                if #available(iOS 26.0, *) {
                    Text("Add the link")
                        .padding()
                        .foregroundStyle(isButtonDisabled ? .gray :.orange)
                        .bold()
                        .glassEffect(in: .capsule)
                } else {
                    Text("Add the link")
                        .padding()
                        .foregroundStyle(.white)
                        .bold()
                        .background {
                            isButtonDisabled ? Color.gray : Color.orange
                        }
                        .clipShape(Capsule())
                }
            })
            .padding(.top)
    
            
        }
        .padding()
        .background {
            Image("bgAdd")
        }
        
    }
}
```

## File: View/NewWordView.swift
```swift
//
//  NewWordView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI
import SwiftData

struct NewWordView: View {
    @Query(sort: [SortDescriptor(\Card.addDate, order: .reverse)], animation: .default) private var cards: [Card]
    @Environment(\.modelContext) private var modelContext
    
    @ObservedObject var cardsViewModel: CardsViewModel
    
    var existingCard: Card? = nil
    
    @State private var word = ""
    @State private var translation = ""
    @State private var comment = ""
    
    private var isButtonDisabled: Bool {
        word.count < 1 || translation.count < 1 ? true : false
    }
    
    private var isEditMode: Bool {
        existingCard != nil
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Text(isEditMode ? "Edit word" : "New word")
                Spacer()
                if #available(iOS 26.0, *) {
                    Button(action: {
                        hapticSelection()
                        dismissView()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.orange)
                    })
                    .buttonStyle(.glass)
                } else {
                    Button(action: {
                        hapticSelection()
                        dismissView()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.orange)
                    })
                }
            }
                    .font(.title)
                    .bold()
                    .fontDesign(.rounded)
            
            Spacer()
            
            GlassTextFieldView(text: $word, placeholder: NSLocalizedString("Foreign word", comment: "Foreign word"))
            
            GlassTextFieldView(text: $translation, placeholder: NSLocalizedString("Translation", comment: "Translation"))
            
            GlassTextFieldView(text: $comment, placeholder: NSLocalizedString("Comment", comment: "Comment"))
            
            Button(action: {
                if isEditMode {
                    updateCard()
                } else {
                    addCard()
                }
            }, label: {
                if #available(iOS 26.0, *) {
                    Text(isEditMode ? "Update the word" : "Add the word")
                        .padding()
                        .foregroundStyle(isButtonDisabled ? .gray :.orange)
                        .bold()
                        .glassEffect(in: .capsule)
                } else {
                    Text(isEditMode ? "Update the word" : "Add the word")
                        .padding()
                        .foregroundStyle(.white)
                        .bold()
                        .background {
                            isButtonDisabled ? Color.gray : Color.orange
                        }
                        .clipShape(Capsule())
                }
            })
            .padding(.top)
            .disabled(isButtonDisabled)
        }
        .padding()
        .background {
            Image("bgAdd")
        }
        .onAppear {
            loadExistingCard()
        }
    }
    
    private func loadExistingCard() {
        if let card = existingCard {
            word = card.foreignWord ?? ""
            translation = card.translation ?? ""
            comment = card.comment ?? ""
        }
    }
    
    private func addCard() {
        let card = Card(foreignWord: word, translation: translation, comment: comment)
        modelContext.insert(card)
        hapticNotification(.success)
        dismissView()
    }
    
    private func updateCard() {
        guard let card = existingCard else { return }
        card.foreignWord = word
        card.translation = translation
        card.comment = comment
        hapticNotification(.success)
        dismissView()
    }
    
    private func dismissView() {
        cardsViewModel.addViewHandler = nil
        cardsViewModel.editCardHandler = nil
    }
}

//#Preview {
//    NewWordView(cardsViewModel: CardsViewModel())
//}
```

## File: View/ResourceItemView.swift
```swift
//
//  ResourceItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct ResourceItemView: View {

    @State private var offsetX: CGFloat = 0
    @State private var isDragging = false
    @State private var initialTouchPoint: CGPoint?
    @State private var isExpanded = false

    var onDelete: () -> Void
    var resource: Resource

    var body: some View {
        if #available(iOS 26.0, *) {
            modernResourceView()
        } else {
            legacyResourceView()
        }
    }

    // MARK: - iOS 26+ Modern Design
    @available(iOS 26.0, *)
    private func modernResourceView() -> some View {
        VStack(spacing: 0) {
            Button(action: {
                hapticSelection()
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    isExpanded.toggle()
                }
            }) {
                content()
                    .blur(radius: isExpanded ? 8 : 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 20))
            .overlay {
                if isExpanded {
                    actionButtons()
                }
            }
        }
        .frame(maxWidth: .infinity)
    }

    @available(iOS 26.0, *)
    private func actionButtons() -> some View {
        GlassEffectContainer {
            Button(action: {
                hapticNotification(.warning)
                withAnimation(.spring()) {
                    isExpanded = false
                    onDelete()
                }
            }) {
                Image(systemName: "trash.fill")
                    .font(.title2)
                    .bold()
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.glass)
            .tint(.red)
        }
    }

    // MARK: - Legacy iOS Design (iOS 18 and below)
    private func legacyResourceView() -> some View {
        ZStack(alignment: .trailing) {
            // Фон "удаления" (справа), показывается только когда свайпнули влево
            if offsetX < 0 {
                deleteBackground()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }

            content()
                .background(cardBackground())
                .offset(x: offsetX)
                // Вместо .gesture(...) используем .simultaneousGesture(...)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 15)
                        .onChanged { value in
                            if initialTouchPoint == nil {
                                initialTouchPoint = value.startLocation
                            }
                            let dragDiff = value.location - (initialTouchPoint ?? .zero)
                            // Проверяем, что горизонтальный драг > вертикального * 2
                            if abs(dragDiff.x) > abs(dragDiff.y) * 2 {
                                isDragging = true
                                withAnimation(.interactiveSpring()) {
                                    // Запрещаем сдвиг вправо, чтобы свайп был только влево
                                    offsetX = min(0, value.translation.width)
                                }
                            }
                        }
                        .onEnded { value in
                            initialTouchPoint = nil
                            isDragging = false

                            withAnimation(.spring()) {
                                // Если ушли левее, чем ~ 45% экрана — удаляем
                                if -offsetX > screenSize().width * 0.45 {
                                    offsetX = -screenSize().width
                                    hapticNotification(.warning)
                                    onDelete()
                                } else {
                                    offsetX = 0
                                }
                            }
                        }
                )
        }
        .frame(maxWidth: .infinity)
    }

    private func content() -> some View {
        VStack(alignment: .leading) {
            Text(resource.title ?? "")
                .bold()
            Divider()
            Link(resource.link ?? "", destination: URL(string: resource.link ?? "lapov.art")!)
                .foregroundColor(.gray)
        }
        .padding()
    }

    // Фон с иконкой "мусорной корзины"
    private func deleteBackground() -> some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "trash")
                    .font(.title)
                // Если свайпнули сильнее 15% экрана, показываем текст
                if -offsetX / screenSize().width > 0.15 {
                    Text("Swipe to delete")
                        .font(.caption)
                }
            }
            .foregroundColor(.white)
            // Ширина слоя зависит от величины offset
            .frame(width: -offsetX)
            // Для плавного проявления можем использовать opacity
            .opacity(Double(-offsetX / 100))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.8))
    }

    private func cardBackground() -> some View {
        GlassView()
            .background(
                Color.white.opacity(0.2)
                    .overlay(
                        Color.red.opacity(offsetX < 0 ? -offsetX / screenSize().width * 0.5 : 0)
                    )
            )
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 7, x: 2, y: 2)
    }

    // Вариант метода для вычисления размера экрана
    private func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

#Preview {
    ResourcesView()
        .modelContainer(for: Resource.self)
}
```

## File: View/ResourcesView.swift
```swift
//
//  ResourcesView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI
import SwiftData

struct ResourcesView: View {
    @Query(sort: [SortDescriptor(\Resource.addDate, order: .reverse)], animation: .default) private var resources: [Resource]

    @Environment(\.modelContext) private var modelContext

    @ObservedObject var resourcesViewModel = ResourcesViewModel()

    var body: some View {
        VStack {
            HStack {
                Text("Useful links")
                    .font(.title)
                    .fontDesign(.rounded)
                    .bold()
                Spacer()
                if #available(iOS 26, *) {
                    Button(action: {
                        hapticSelection()
                        resourcesViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .padding(3)
                    })
                    .buttonStyle(.glassProminent)
                    .tint(Color(.orange))
                } else {
                    Button(action: {
                        hapticSelection()
                        resourcesViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(7)
                            .background {
                                Circle()
                                    .fill(.orange)
                                    .opacity(0.95)
                            }
                    })
                    .buttonStyle(.plain)
                }

            }
            .padding(.horizontal)
            .padding(.bottom, -7)

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(resources) { resource in
                        ResourceItemView(onDelete: {
                            modelContext.delete(resource)
                        }, resource: resource)
                        .padding(.horizontal)
                        .padding(.top, 7)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .background {
            Image("bgResources")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .ignoresSafeArea(edges: .bottom)
        .sheet(item: $resourcesViewModel.addViewHandler) {_ in
            NewLinkView(resourcesViewModel: resourcesViewModel)
        }
    }
}

#Preview {
    ResourcesView()
        .modelContainer(for: Resource.self)
}
```

## File: View/SearchView.swift
```swift
//
//  SearchView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/01/2026.
//

import SwiftUI
import SwiftData

@available(iOS 26, *)
struct SearchView: View {
    @Query(sort: [SortDescriptor(\Card.addDate, order: .reverse)]) private var cards: [Card]
    @Query private var settings: [Settings]

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismissSearch) private var dismissSearch

    @Binding var searchText: String
    @State private var language: String = "🏳️"

    @ObservedObject var cardsViewModel = CardsViewModel()

    private var filteredCards: [Card] {
        guard !searchText.isEmpty else { return [] }
        return cards.filter { card in
            (card.foreignWord ?? "").localizedCaseInsensitiveContains(searchText) ||
            (card.translation ?? "").localizedCaseInsensitiveContains(searchText) ||
            (card.comment ?? "").localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        Group {
            if searchText.isEmpty {
                emptySearchView
            } else if filteredCards.isEmpty {
                noResultsView
            } else {
                searchResultsView
            }
        }
        .background {
            Image("bgList")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .sheet(item: Binding(
            get: { cardsViewModel.editCardHandler?.handler },
            set: { newValue in
                if newValue == nil {
                    cardsViewModel.editCardHandler = nil
                }
            }
        )) { _ in
            if let editCard = cardsViewModel.editCardHandler?.card {
                NewWordView(cardsViewModel: cardsViewModel, existingCard: editCard)
            }
        }
        .onAppear {
            loadLanguageSetting()
        }
    }

    // MARK: - Empty Search View
    private var emptySearchView: some View {
        ContentUnavailableView(
            NSLocalizedString("search_prompt_title", comment: ""),
            systemImage: "magnifyingglass",
            description: Text(NSLocalizedString("search_prompt_description", comment: ""))
        )
    }

    // MARK: - No Results View
    private var noResultsView: some View {
        ContentUnavailableView.search(text: searchText)
    }

    // MARK: - Search Results View
    private var searchResultsView: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(filteredCards) { card in
                    CardItemView(
                        onDelete: {
                            withAnimation(.spring()) {
                                modelContext.delete(card)
                            }
                        },
                        onEdit: {
                            cardsViewModel.editCardHandler = (card: card, handler: ModalHandler())
                        },
                        onResetRating: {
                            card.rating = 4
                        },
                        card: card,
                        language: language
                    )
                    .padding(.horizontal)
                    .padding(.top, 7)
                }
            }
            .padding(.bottom, 100)
        }
    }

    private func loadLanguageSetting() {
        if let firstSettings = settings.first {
            language = firstSettings.language ?? "🏳️"
        }
    }
}
```

## File: View/SettingsView.swift
```swift
//
//  SettingsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//
//
import SwiftUI
import SwiftData
import StoreKit

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.requestReview) var requestReview
    @Query private var settings: [Settings]

    @State private var language: String = "🏳️"
    @State private var startupTab: Tab = .words

    // App info
    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }

    private var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    }

    var body: some View {
        NavigationStack {
            Form {
                // MARK: - App Header
                Section {
                    appHeaderView()

                    NavigationLink {
                        MoreAppsView()
                    } label: {
                        Label("More Apps", systemImage: "square.grid.2x2")
                    }
                }

                // MARK: - About
                Section("About") {
                    NavigationLink {
                        HowToUseView()
                    } label: {
                        Label("How to Use", systemImage: "questionmark.circle")
                    }
                }

                // MARK: - Customization
                Section("Customization") {
                    HStack {
                        Label("Language", systemImage: "globe")
                        Spacer()
                        TextField("🏳️", text: $language)
                            .multilineTextAlignment(.trailing)
                            .frame(maxWidth: 100)
                            .onChange(of: language) { _, newValue in
                                if newValue.count > 20 {
                                    language = String(newValue.prefix(20))
                                }
                            }
                    }

                    Picker(selection: $startupTab) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Text(tab.localizedName).tag(tab)
                        }
                    } label: {
                        Label("Startup Page", systemImage: "house")
                    }
                }

                // MARK: - Feedback
                Section("Feedback") {
                    Button {
                        writeToDeveloper()
                    } label: {
                        Label(NSLocalizedString("Write to developer", comment: ""), systemImage: "envelope")
                            .foregroundStyle(.primary)
                    }

                    Button {
                        requestReview()
                    } label: {
                        Label("Review on the App Store", systemImage: "star")
                            .foregroundStyle(.primary)
                    }
                }

                // MARK: - General
                Section("General") {
                    Button {
                        openSystemSettings()
                    } label: {
                        Label("System Settings", systemImage: "gear")
                            .foregroundStyle(.primary)
                    }
                }
            }
//            .navigationTitle("Settings")
//            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: loadSettings)
        .onChange(of: language) { saveSettings() }
        .onChange(of: startupTab) { saveSettings() }

    }

    // MARK: - App Header View
    @ViewBuilder
    private func appHeaderView() -> some View {
        HStack(spacing: 16) {
            // App Icon
            if let iconImage = getAppIcon() {
                Image(uiImage: iconImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            } else {
                RoundedRectangle(cornerRadius: 14)
                    .fill(.secondary.opacity(0.3))
                    .frame(width: 60, height: 60)
                    .overlay {
                        Image(systemName: "square.2.layers.3d")
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("LexiSwipe")
                    .font(.headline)
                Text("\(appVersion)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }

    // MARK: - Helper Functions
    private func getAppIcon() -> UIImage? {
        guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? [String],
              let lastIcon = iconFiles.last else {
            return nil
        }
        return UIImage(named: lastIcon)
    }

    private func openSystemSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }

    private func loadSettings() {
        if let existingSettings = settings.first {
            language = existingSettings.language ?? "🏳️"
            startupTab = existingSettings.mainTab
        } else {
            let newSettings = Settings(language: "🏳️", mainTab: .words, theme: "default", notificationsEnabled: false, notificationFrequency: "daily", dailyGoal: 20, stat: 100.00)
            modelContext.insert(newSettings)
        }
    }

    private func saveSettings() {
        if let existingSettings = settings.first {
            existingSettings.language = language
            existingSettings.mainTab = startupTab
        } else {
            let newSettings = Settings(language: language, mainTab: startupTab, theme: "default", notificationsEnabled: false, notificationFrequency: "daily", dailyGoal: 20, stat: 100.00)
            modelContext.insert(newSettings)
        }

        do {
            try modelContext.save()
        } catch {
            print("Error saving settings: \(error)")
        }
    }

    private func writeToDeveloper() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        let subject = String(format: NSLocalizedString("Feedback for LexiSwipe app (v%@)", comment: "Email subject"), appVersion)
        let body = String(format: NSLocalizedString("emailBody", comment: "Email body"))
        let recipient = "lapov.art@gmail.com"

        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        let urlString = "mailto:\(recipient)?subject=\(subjectEncoded)&body=\(bodyEncoded)"

        if let url = URL(string: urlString) {
            UIApplication.shared.open(url) { success in
                if !success {
                    print("Failed to open mail app")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .modelContainer(for: [Settings.self])
}
```

## File: View/TabBarItemView.swift
```swift
//
//  TabBarItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct TabBarItemView: View {
    
    var tab: Tab
    
    @Binding var activeTab: Tab
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.interactiveSpring(response: 0.6,
                                                 dampingFraction: 0.6,
                                                 blendDuration: 0.6)) {
                    activeTab = tab
                    hapticSelection()
                }
            } label: {
                HStack {
                    Image(systemName: tab.image)
                        //.resizable()
                        .font(.title2)
                        .frame(width: 20, height: 20)
                    if activeTab == tab {
                        Text(tab.localizedName)
                            .font(.title3)
                            .fontDesign(.rounded)
                            .bold()
                    }
                }
               .foregroundColor(activeTab == tab ? (colorScheme == .dark ? .white : .black) : .gray)
            }
        }
    }
}
```

## File: ViewModel/CardsViewModel.swift
```swift
//
//  CardsViewModel.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import Foundation



class CardsViewModel: ObservableObject {
    @Published var addViewHandler: ModalHandler?
    @Published var editCardHandler: (card: Card, handler: ModalHandler)?
}
```

## File: ViewModel/LearnViewModel.swift
```swift
//
//  LearnViewModel.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 30/06/2024.
//

import SwiftUI
import SwiftData

class LearnViewModel: ObservableObject {
    @Published var currentCard: Card?
    @Published var translationIsShown = false
    
    private var cards: [Card] = []
    private var modelContext: ModelContext?
    
    func setModelContext(_ context: ModelContext) {
        self.modelContext = context
        fetchCards()
        selectRandomCard()
    }
    
    func fetchCards() {
        guard let context = modelContext else { return }
        let descriptor = FetchDescriptor<Card>(predicate: #Predicate { $0.rating ?? 0 > 0 })
        do {
            cards = try context.fetch(descriptor)
            print("Fetched \(cards.count) cards")
        } catch {
            print("Failed to fetch cards: \(error)")
            cards = []
        }
    }
    
    func selectRandomCard() {
        guard !cards.isEmpty else {
            currentCard = nil
            translationIsShown = false
            return
        }
        
        let totalWeight = cards.reduce(0) { $0 + ($1.rating ?? 1) }
        guard totalWeight > 0 else {
            currentCard = cards.randomElement()
            return
        }
        
        var randomWeight = Int.random(in: 1...totalWeight)
        
        for card in cards {
            randomWeight -= card.rating ?? 1
            if randomWeight <= 0 {
                currentCard = card
                break
            }
        }
        
        translationIsShown = false
    }
    
    func showTranslation() {
        translationIsShown = true
    }
    
    func updateRatingAndNextCard(isEasy: Bool) {
        updateRating(isEasy: isEasy)
        selectRandomCard()
    }
    
    private func updateRating(isEasy: Bool) {
        guard let currentCardId = currentCard?.id,
              let index = cards.firstIndex(where: { $0.id == currentCardId }),
              let context = modelContext else {
            return
        }
        
        if isEasy {
            cards[index].rating = max(0, (cards[index].rating ?? 1) - 1)
        } else {
            cards[index].rating = (cards[index].rating ?? 1) + 1
        }
        
        do {
            try context.save()
            print("Updated rating for card: \(String(describing: cards[index].foreignWord)), new rating: \(cards[index].rating ?? 0)")
        } catch {
            print("Failed to save context: \(error)")
        }
        
        fetchCards()
    }
}
```

## File: ViewModel/ResourcesViewModel.swift
```swift
//
//  ResourcesViewModel.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import Foundation

class ResourcesViewModel: ObservableObject {
    @Published var addViewHandler: ModalHandler?
}
```

## File: CartesDeMots.entitlements
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>aps-environment</key>
	<string>development</string>
	<key>com.apple.developer.icloud-container-identifiers</key>
	<array>
		<string>iCloud.art.lapov.CartesDeMots</string>
	</array>
	<key>com.apple.developer.icloud-services</key>
	<array>
		<string>CloudKit</string>
	</array>
</dict>
</plist>
```

## File: CartesDeMotsApp.swift
```swift
//
//  CartesDeMotsApp.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

//import SwiftUI
//import SwiftData
//
//@main
//struct CartesDeMotsApp: App {
//    var body: some Scene {
//        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
//        
//        WindowGroup {
//            ContentView()
//                //.preferredColorScheme(.light)
//                .modelContainer(for: [Card.self, Resource.self, Settings.self], inMemory: false, isAutosaveEnabled: true, isUndoEnabled: true) { result in
//                    switch result {
//                    case .success(let success):
//                        print("ModelContainer created successfully")
//                        do {
//                            try success.mainContext.save()
//                        } catch {
//                            print("Error saving context: \(error)")
//                        }
//                    case .failure(let failure):
//                        print("Error when creating ModelContainer \(failure.localizedDescription)")
//                    }
//                }
//        }
//    }
//}
import SwiftUI
import SwiftData
import CloudKit

@main
struct CartesDeMotsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Card.self, Resource.self, Settings.self]) { result in
                    switch result {
                    case .success(let container):
                        // Включаем автоматическое сохранение
                        container.mainContext.autosaveEnabled = true
                        print("✅ ModelContainer successfully created")
                        
                        // Проверяем статус CloudKit
                        checkCloudKitStatus()
                        
                    case .failure(let error):
                        print("🛑 Error creating ModelContainer: \(error.localizedDescription)")
                    }
                }
        }
    }
    
    private func checkCloudKitStatus() {
        CKContainer.default().accountStatus { status, error in
            switch status {
            case .available:
                print("iCloud is available")
            case .noAccount:
                print("⚠️ The user is not authorized in iCloud")
            case .couldNotDetermine:
                print("⚠️ Failed to determine iCloud status")
            case .restricted:
                print("⚠️ Access to iCloud is limited")
            case .temporarilyUnavailable:
                print("⚠️ Access to iCloud is temporarily restricted")
            @unknown default:
                print("⚠️ Unknown iCloud status")
            }
            
            if let error = error {
                print("🛑 ERROR CloudKit: \(error.localizedDescription)")
            }
        }
    }
}
```

## File: CartesDeMotsRelease.entitlements
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>aps-environment</key>
	<string>development</string>
	<key>com.apple.developer.icloud-container-identifiers</key>
	<array>
		<string>iCloud.art.lapov.CartesDeMots</string>
	</array>
	<key>com.apple.developer.icloud-services</key>
	<array>
		<string>CloudKit</string>
	</array>
</dict>
</plist>
```

## File: Info.plist
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>UIBackgroundModes</key>
	<array>
		<string>remote-notification</string>
	</array>
</dict>
</plist>
```
