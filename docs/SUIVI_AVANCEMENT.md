# Suivi d’avancement — Cuisine Pro

Mise à jour : 28 octobre 2026

## Liens directs
- Application web : https://kevinhoffmann313-cmyk.github.io/cuisine-pro/
- Prototype de l’offre Premium (simulation, aucun paiement réel) : https://kevinhoffmann313-cmyk.github.io/cuisine-pro/prototype.html
- Dépôt : https://github.com/kevinhoffmann313-cmyk/cuisine-pro
- Vérifications et compilations : https://github.com/kevinhoffmann313-cmyk/cuisine-pro/actions

## Fait et enregistré
- Conservation des archives HACCP/températures et de la traçabilité : suppression automatique désactivée.
- Script de vérification JavaScript et contrôles de base de l’application.
- Workflow GitHub Actions de validation.
- Workflow de compilation Android (APK de test) et iOS (application pour simulateur, non signée).
- Dépendance TypeScript ajoutée pour Capacitor.
- Pages de confidentialité et conditions ajoutées en brouillon.
- Pages légales incluses dans la préparation des bundles mobiles.
- Cache service worker passé à `cuisine-pro-v46`, pages légales ajoutées au cache.
- Vérifications automatiques ajoutées pour la présence des pages légales dans le bundle.
- Fiche de préparation aux boutiques et checklist de lancement déjà présentes dans `docs/`.

## État des derniers workflows
- Validation du commit `01df96cab9dab33b01bc8fb26711d59fe99afb44` : succès.
- Déploiement GitHub Pages de ce commit : succès.
- Compilation mobile du même commit : en cours lors de cette mise à jour. Vérifier la page Actions pour les résultats définitifs.

## À terminer avant publication
1. Configurer les applications Apple/Google dans RevenueCat et créer les produits ainsi que l’entitlement `premium`.
2. Intégrer le SDK natif à un vrai parcours d’achat et à la restauration des achats.
3. Mettre en place une validation serveur fiable des transactions et des renouvellements.
4. Synchroniser les photos de traçabilité dans le cloud.
5. Compléter les informations légales et de support.
6. Signer les builds de production, puis tester sur de vrais appareils.
7. Compléter les fiches, déclarations et soumissions des boutiques.

## Sécurité
- Ne jamais intégrer une clé Supabase `service_role` ou une clé secrète RevenueCat au code client.
- Ne pas activer Premium sur la seule base du navigateur ou du stockage local.
- Ne pas annoncer que les paiements fonctionnent tant qu’ils n’ont pas été configurés et testés.
- Les pages légales existantes sont des brouillons à compléter, pas une validation juridique.

## Consigne pour la prochaine reprise
Lire ce fichier, inspecter les commits et l’état des workflows avant de reprendre. Actualiser ce suivi après chaque étape importante.
