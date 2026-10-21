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

## Pré-requis avant activation
1. Créer/choisir un projet Supabase.
2. Configurer l'authentification et l'URL de retour de l'application.
3. Examiner puis faire approuver le script `supabase/traceabilite-schema.sql`.
4. Exécuter le script uniquement après accord explicite.
5. Ajouter la configuration publique du projet à l'application.
6. Implémenter et tester l'interface photo, la connexion, les droits d'accès et les erreurs réseau sur iPhone et Mac.
7. Valider l'export et la récupération des photos avant déploiement.

## Sécurité et limites
Le SQL est une proposition non exécutée. Les politiques doivent être testées dans le projet réel avant toute utilisation professionnelle. Les photos et fiches ne seront pas synchronisées tant que le backend n'est pas configuré et l'interface connectée. Ce module ne remplace pas les procédures de réception et le PMS validé.
