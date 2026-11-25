# Mission CP · Mike

Application d'entraînement pour Mike (CP). Une seule page : `index.html`.

## Mise en ligne (GitHub Pages)

1. Créer le dépôt `mike-cp` sur GitHub (public) et y déposer `index.html`, `supabase.sql`, `README.md` et `.nojekyll`.
2. Dépôt > Settings > Pages > Source : branche `main`, dossier `/ (root)`.
3. L'adresse est : `https://<compte>.github.io/mike-cp/`

## Synchronisation sur un serveur (Supabase, gratuit)

Sans serveur, les résultats restent dans l'iPad. Avec Supabase, ils sont enregistrés en ligne et retrouvés sur tous les appareils : envoi 1 seconde après chaque réponse, lecture toutes les 10 secondes.

1. Créer un compte sur supabase.com et un projet (nom libre, mot de passe de base de données au choix).
2. Menu **SQL Editor** > **New query** : coller le contenu de `supabase.sql` > **Run**.
3. Menu **Project Settings > API** : copier l'adresse du projet (`Project URL`) et la clé publique (`anon` ou `publishable`).
4. Dans `index.html`, remplir la ligne :
   `var SYNC = { url: "https://xxxx.supabase.co", key: "la-clé-publique", id: "mike", poll: 10000 };`
5. Enregistrer sur GitHub. En bas de l'appli, on lit « ☁️ Synchronisé ».

## À savoir

- La clé publique est visible dans le code de la page : c'est normal, elle ne donne accès qu'à la table `mike_state`. Ce ne sont que des scores, mais toute personne qui connaît l'adresse du projet et la clé pourrait les lire ou les modifier.
- Sans réseau, l'appli continue de marcher et renvoie tout dès que le réseau revient.
- Si deux appareils travaillent en même temps, la dernière modification gagne.
