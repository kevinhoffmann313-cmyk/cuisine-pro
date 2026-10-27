# Cuisine Pro — plan de commercialisation

## Positionnement
Application destinée aux chefs et professionnels de la restauration, distribuée sur iOS et Android avec une offre gratuite et un abonnement Premium à 4,99 € par mois.

## Offre gratuite
- Hygiène / suivi HACCP et relevés de température
- Traçabilité des produits, lots et DLC
- Plan de nettoyage et historique
- Création, modification et suppression de recettes personnelles
- Compte, sauvegarde et synchronisation des données du chef

## Offre Premium — 4,99 €/mois
- Toutes les fonctions gratuites
- Catalogue éditorial de recettes Cuisine Pro
- Ajout des recettes du catalogue au carnet personnel
- Liste de courses à partir des recettes sélectionnées
- Calcul des quantités et regroupement des ingrédients

## Principes de conception
- Les recettes personnelles et les recettes du catalogue doivent être stockées séparément.
- Les données HACCP et les recettes privées appartiennent à chaque compte et ne doivent jamais être exposées à d'autres chefs.
- Le statut Premium doit être vérifié côté serveur à partir d'un achat validé par Apple/Google; ne pas faire confiance à un simple indicateur local.
- Les abonnements doivent pouvoir être restaurés après réinstallation et sur un second appareil.
- Les fonctions de base ne doivent pas disparaître quand un abonnement prend fin; seules les fonctions Premium sont verrouillées. Les données personnelles ne doivent pas être supprimées.
- Prévoir suppression de compte, export de données, politique de confidentialité, conditions d'abonnement, support et mécanisme de restauration des achats.

## État actuel et limites
- L'application web existe dans `index.html` et utilise `localStorage` pour une partie des données et IndexedDB pour les photos.
- Une première synchronisation Supabase a été signalée comme réussie, mais la synchronisation multi-appareils et les conflits de modifications restent à tester.
- Les photos de traçabilité ne sont pas encore synchronisées dans le cloud.
- Le paiement récurrent n'est pas implémenté. Il ne faut pas annoncer l'offre Premium comme achetable tant que la validation Apple/Google, les reçus et les droits serveur ne sont pas développés et testés.
- La configuration Capacitor ci-jointe prépare le conteneur mobile; les projets natifs, certificats, icônes/splash, tests et soumissions restent à effectuer.

## Ordre de réalisation
1. Sauvegarde/export de sécurité et audit des données existantes.
2. Séparer catalogue public et recettes personnelles sans supprimer ni déplacer les recettes déjà enregistrées.
3. Ajouter les écrans Gratuit/Premium et des garde-fous serveur pour les fonctions Premium.
4. Mettre en place les achats intégrés iOS/Android, validation serveur, restauration et gestion de résiliation.
5. Fiabiliser la synchronisation Supabase, y compris les photos, les conflits et les sauvegardes.
6. Construire et tester les applications natives iOS/Android.
7. Préparer confidentialité/RGPD, suppression de compte, support, fiches de boutique et soumission.

## Préparation Capacitor
- Installer une version LTS récente de Node.js.
- Lancer `npm install`.
- Lancer `npm run prepare:web` puis `npx cap add ios` et `npx cap add android` (une seule fois par plateforme).
- Lancer `npm run cap:sync` après les modifications web.
- La compilation iOS et la signature App Store nécessitent un environnement macOS avec Xcode; la publication exige les comptes développeur correspondants.
