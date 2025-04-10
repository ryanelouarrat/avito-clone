# Rapport de Création du Clone du Site Avito

## Besoins Fonctionnels

- Gestion des annonces (création, consultation, modification, suppression)
- Gestion des utilisateurs (inscription, authentification, gestion du profil)
- Sécurisation des mots de passe via has_secure_password
- Gestion des sessions (login/logout)

**Diagramme UML de classes :**  
_[Insérer le diagramme UML ici]_

**Diagramme de cas d'utilisation :**  
_[Insérer le diagramme des cas d'utilisation ici]_

**Diagramme de séquence :**  
_[Insérer le diagramme de séquence ici]_

## Explication des Méthodes des Contrôleurs et des Vues (Backend)

### Contrôleurs

- **AnnoncesController**  
  - *index* : Récupère et affiche toutes les annonces.  
  - *show* : Affiche le détail d'une annonce spécifique.  
  - *new* et *create* : Permettent la création d'une nouvelle annonce.  
    - Dans *create*, l'annonce est initialisée, associée à un utilisateur (actuellement avec un id statique) puis sauvegardée en base.  
  - *edit* et *update* : Permettent la modification d'une annonce existante.  
  - *destroy* : Permet la suppression d'une annonce.

- **UtilisateursController**  
  - Gère l'inscription et l'affichage des informations utilisateur.  
  - Les méthodes de ce contrôleur intégreront l'ensemble de la logique d'inscription et la gestion du profil utilisateur.

- **SessionsController**  
  - Gère la connexion et la déconnexion (login/logout) des utilisateurs.  
  - Ce contrôleur sera étendu pour inclure la logique d'authentification.

### Vues

- **Vues des Annonces** (dans `app/views/annonces/`)  
  - *index.html.erb* : Affiche la liste de toutes les annonces avec des liens vers la consultation, la modification et la suppression.  
  - *show.html.erb* : Affiche les détails d'une annonce, incluant titre, description, prix, localisation et date de publication.  
  - *new.html.erb* et *edit.html.erb* : Utilisent un formulaire partiel (`_form.html.erb`) pour la création ou la modification d'une annonce.

- **Layout** (`app/views/layouts/application.html.erb`)  
  - Gère la structure globale de l'application, incluant la navigation et l'affichage des messages de notification.

## Conclusion

Le backend du clone Avito a été conçu pour supporter les opérations CRUD sur les annonces et la gestion basique des utilisateurs et sessions. Des améliorations futures pourront inclure l'implémentation complète de l'authentification, des validations plus poussées et une gestion avancée des erreurs.
