# Cuisine Pro — traçabilité partagée des viandes et poissons

## État
Préparation sur la branche `feature/traceabilite-photos`. Aucun fichier de production n'a été modifié sur `main`, aucun déploiement n'a été déclenché et aucune migration n'a été exécutée.

## Objectif fonctionnel
- Créer une fiche de réception pour viande, poisson ou autre produit.
- Enregistrer la date de réception, le produit, le fournisseur, le numéro de lot, la DLC/DDM, la quantité et l'unité.
- Joindre plusieurs photos par fiche (étiquettes, bon de livraison).
- Retrouver les fiches sur iPhone et Mac avec une authentification.
- Rechercher par produit, fournisseur, lot et date.
- Garder les données actuelles de Cuisine Pro intactes ; aucune importation automatique des lots locaux.

## Architecture proposée
- Application statique GitHub Pages.
- Supabase Auth pour l'accès utilisateur.
- Table `public.traceability_records` avec Row Level Security.
- Bucket Storage privé `traceability-photos`.
- Chemins de fichiers cloisonnés par identifiant utilisateur.
- Clé publique/anon uniquement côté navigateur ; jamais de clé service_role dans l'application.

## Étape suivante — activation contrôlée
1. Créer ou choisir un projet Supabase dans le compte du propriétaire.
2. Dans les réglages d'authentification, configurer l'URL du site et l'URL de retour `https://kevinhoffmann313-cmyk.github.io/cuisine-pro/`.
3. Examiner le script `supabase/traceabilite-schema.sql` avant exécution. Il crée la table, active RLS, définit des politiques cloisonnées par `auth.uid()`, crée un bucket privé et maintient `updated_at`.
4. Exécuter le script uniquement dans le projet choisi, après vérification. Le script est conçu pour être rejoué, mais il faut vérifier le résultat dans l'éditeur SQL et Storage.
5. Récupérer uniquement l'URL du projet et la clé publique `anon`/publishable. Ne jamais mettre une clé `service_role` ou un secret serveur dans le dépôt ou le navigateur.
6. Implémenter l'interface de connexion et la synchronisation dans l'application, avec états de chargement, erreurs réseau et règles d'accès.
7. Tester avec deux sessions distinctes : chaque compte ne doit voir ni modifier les fiches ou photos de l'autre.
8. Tester ajout, lecture, modification, suppression, photos, déconnexion, restauration réseau et export avant déploiement.
9. Ne pas importer automatiquement les lots/photos déjà stockés localement. Prévoir une migration explicite après sauvegarde et validation.

## État actuel
- Le schéma SQL a été amélioré pour pouvoir être rejoué et mettre `updated_at` à jour.
- Aucun projet Supabase n'a été connecté depuis cette conversation ; aucune migration SQL n'a été exécutée.
- L'application de production continue d'utiliser le stockage local. La synchronisation n'est pas activée tant que la configuration du projet et l'interface ne sont pas ajoutées et testées.

## Sécurité et limites
Le SQL est une proposition non exécutée. Les politiques doivent être testées dans le projet réel avant toute utilisation professionnelle. Les photos et fiches ne seront pas synchronisées tant que le backend n'est pas configuré et l'interface connectée. Ce module ne remplace pas les procédures de réception et le PMS validé.
