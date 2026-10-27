# Checklist de lancement Cuisine Pro (iOS + Android)

## État du dépôt
- App web existante dans `index.html`.
- Capacitor configuré dans `capacitor.config.ts`.
- Préparation des fichiers web via `npm run prepare:web`.
- SDK RevenueCat Capacitor déclaré dans `package.json`; il reste à l'initialiser dans un build natif et à configurer les produits.
- Le droit Premium est lu dans Supabase depuis `cuisine_pro_entitlements`. La table seule ne suffit pas : aucun achat ne doit être déclaré actif tant qu'une source fiable n'a pas validé la transaction.

## Actions que le propriétaire doit faire dans ses comptes
1. **Supabase** : exécuter `supabase/migrations/202610270001_cuisine_pro_entitlements.sql` dans SQL Editor. Ne pas donner la clé `service_role` au client.
2. **RevenueCat** : créer un projet, ajouter une app iOS et une app Android, puis configurer les identifiants de produits et une entitlement appelée `premium`.
3. **App Store Connect** : créer l'app avec l'identifiant de bundle `fr.cuisinepro.app`, remplir les informations légales et créer l'abonnement auto-renouvelable à 4,99 €/mois.
4. **Google Play Console** : créer l'app avec l'identifiant Android `fr.cuisinepro.app`, compléter la fiche et créer le produit d'abonnement.
5. Copier uniquement les clés SDK publiques propres à chaque plateforme dans la configuration de build native. Ne jamais placer les clés secrètes RevenueCat ou Supabase service role dans le code client.
6. Fournir la politique de confidentialité, les coordonnées de support, les conditions d'abonnement, les captures d'écran et les déclarations de confidentialité requises par les boutiques.

## Commandes locales
Prérequis : Node.js 22+, npm; pour iOS, un Mac avec Xcode; pour Android, Android Studio et le SDK Android.

```sh
npm install
npm run prepare:web
npx cap add ios
npx cap add android
npm run cap:sync
npx cap open ios
npx cap open android
```

Les commandes `cap add` ne sont à exécuter qu'une fois par plateforme. Après modification de l'application web, exécuter `npm run cap:sync`.

## Tests indispensables
- Compte gratuit : HACCP, traçabilité, nettoyage, création/modification/suppression de recettes personnelles.
- Premium : achat sandbox, accès catalogue et courses, restauration après réinstallation, connexion sur un deuxième appareil.
- Expiration, résiliation, remboursement, période de grâce, perte de connexion, changement de compte.
- Vérifier qu'un client ne peut ni écrire ses droits Premium, ni lire les données d'un autre chef.
- Export et restauration des données avant publication.
- Vérifier les photos de traçabilité : elles sont actuellement stockées localement et ne sont pas encore synchronisées sur tous les appareils.
- Vérifier que les enregistrements HACCP sont conservés et exportables en cas de fin d'abonnement.

## Limites connues — ne pas publier avant résolution
- Le SDK RevenueCat est déclaré comme dépendance, mais l'écran d'achat et la restauration ne sont pas encore reliés au SDK natif.
- Aucun produit réel n'a été créé dans les comptes Apple, Google ou RevenueCat depuis ce dépôt.
- La migration SQL n'a pas été exécutée par ce commit.
- Les droits Premium côté interface ne remplacent pas une validation serveur; la table doit être alimentée uniquement par un service de confiance après vérification des transactions et notifications des boutiques.
- La compilation et la signature natives nécessitent l'environnement développeur et les comptes du propriétaire. Je ne peux pas publier à sa place sans accès et validation de ces comptes.
