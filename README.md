#  Calculatrice Flutter

Une calculatrice moderne et élégante développée avec Flutter, offrant des fonctionnalités avancées et une interface utilisateur intuitive.

<p align="center">
<img src="assets/images/calculator.gif" width="300" alt="calculator App Demo">
</p>


##  Fonctionnalités

###  **Calculatrice de Base**
- Opérations arithmétiques : `+`, `-`, `×`, `÷`
- Support des nombres négatifs avec le bouton `±`
- Calcul de pourcentages avec `%`
- Gestion des nombres décimaux
- Bouton d'effacement `C`

### 🔬 **Mode Scientifique**
 **Fonctions trigonométriques** : `sin`, `cos`, `tan`
 **Fonctions mathématiques** : `√` (racine carrée), `x²` (carré), `1/x` (inverse)
 **Constantes** : `π` (pi)
 **Basculement Degrés/Radians** pour les fonctions trigonométriques
 **Mode compact** : Panneau scientifique repliable

### 🎨 **Thèmes Personnalisables**
 **4 thèmes disponibles** :
    **Classique** : Design épuré et professionnel
    **Sombre** : Interface sombre pour un usage nocturne
    **Néon** : Style cyberpunk avec accents colorés
    **Pastel** : Couleurs douces et apaisantes
    **Material 3** : Design moderne avec ColorScheme dynamique
    **Persistance** : Sauvegarde automatique du thème choisi

###  **Historique des Calculs**
 **Enregistrement automatique** de tous les calculs effectués
 **Interface dédiée** pour consulter l'historique
 **Persistance** : L'historique est sauvegardé entre les sessions
 **Suppression** : Possibilité de vider l'historique

###  **Performance & UX**
 **Fluidité optimisée** : Gestion des appuis rapides et simultanés
 **Animations fluides** : Transitions et effets visuels modernes
 **Feedback haptique** : Vibrations tactiles lors des appuis
 **Responsive** : Interface adaptée à toutes les tailles d'écran

##  Technologies Utilisées

 **Flutter** : Framework de développement cross-platform
 **Dart** : Langage de programmation
 **Provider** : Gestion d'état
 **SharedPreferences** : Persistance des données
 **Material 3** : Design system moderne

##  Installation & Lancement

### Prérequis
- Flutter SDK (version 3.8.1 ou supérieure)
- Dart SDK
- Android Studio / VS Code
- Émulateur ou appareil physique

### Installation
```bash
# Cloner le projet
git clone <url-du-repo>
cd calculatrice

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```
