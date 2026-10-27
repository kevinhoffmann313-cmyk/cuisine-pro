# Fiche de préparation des boutiques — Cuisine Pro

État de préparation : brouillon. Ne pas soumettre tant que les achats intégrés, la suppression de compte, les mentions légales et les tests ne sont pas finalisés.

## Identifiants
- Nom : Cuisine Pro
- Identifiant iOS / Android prévu : `fr.cuisinepro.app`
- Site web : https://kevinhoffmann313-cmyk.github.io/cuisine-pro/
- Politique de confidentialité (brouillon) : https://kevinhoffmann313-cmyk.github.io/cuisine-pro/confidentialite.html
- Conditions (brouillon) : https://kevinhoffmann313-cmyk.github.io/cuisine-pro/conditions.html
- Support technique provisoire : https://github.com/kevinhoffmann313-cmyk/cuisine-pro/issues

## Description courte proposée
Gérez vos relevés d’hygiène, la traçabilité des produits, le nettoyage et vos recettes dans un seul outil pensé pour les professionnels de cuisine.

## Description longue proposée
Cuisine Pro vous aide à organiser les tâches essentielles de votre cuisine professionnelle :
- Enregistrer les contrôles et relevés de température.
- Suivre les réceptions et la traçabilité des produits.
- Organiser le plan de nettoyage et ses tâches.
- Créer, modifier, rechercher et supprimer vos recettes personnelles.
- Exporter et restaurer une sauvegarde de vos données.
- Synchroniser les données structurées après connexion à votre compte, lorsque le service cloud est configuré.

Cuisine Pro est un outil d’organisation. Il ne remplace pas votre plan de maîtrise sanitaire, vos procédures internes ni votre responsabilité de vérifier les informations et de respecter les obligations applicables à votre établissement.

Certaines données sont stockées localement sur l’appareil. Les photos de réception ne sont pas encore synchronisées entre appareils : exportez régulièrement vos données et conservez les preuves nécessaires dans votre propre système d’archivage.

## Premium — uniquement après activation réelle
Offre envisagée : 4,99 € par mois avec une période d’essai de 7 jours, si elle est activée et approuvée par les boutiques. Le prix final, les conditions de renouvellement et la disponibilité de l’essai doivent être configurés dans App Store Connect, Google Play Console et RevenueCat avant d’afficher cette offre comme achetable.

Fonctions prévues : catalogue de recettes éditoriales, copie des recettes dans le carnet personnel, liste de courses, calcul des quantités et regroupement des ingrédients.

## Checklist avant soumission
- [ ] Renseigner le nom légal de l’éditeur et une adresse de contact réelle dans les pages légales.
- [ ] Vérifier la politique de confidentialité par rapport aux pratiques réelles et aux sous-traitants.
- [ ] Mettre en place la suppression de compte et des données associées.
- [ ] Créer les applications dans les deux boutiques avec l’identifiant exact.
- [ ] Créer les produits d’abonnement et l’entitlement `premium` dans RevenueCat.
- [ ] Intégrer le SDK RevenueCat dans le bundle mobile, avec les clés publiques distinctes iOS/Android.
- [ ] Configurer les notifications/webhooks RevenueCat et la mise à jour sécurisée des droits Supabase.
- [ ] Tester achat, essai, renouvellement, résiliation, remboursement, restauration et changement d’appareil.
- [ ] Tester la séparation des données entre deux comptes.
- [ ] Tester export, restauration et comportement hors ligne.
- [ ] Créer les icônes et captures d’écran adaptées aux dimensions exigées par chaque boutique.
- [ ] Ajouter les coordonnées de support, les catégories, les classifications d’âge et les déclarations de confidentialité.
- [ ] Obtenir les builds natifs signés, les tester sur appareils physiques et soumettre aux examens Apple/Google.
- [ ] Respecter les exigences de test préalable propres au compte Google Play.

## Limites connues
- Les achats intégrés ne sont pas encore actifs.
- Les photos restent locales.
- Les pages de confidentialité et de conditions sont des brouillons à compléter et valider.
- Les builds CI ne sont pas des builds de publication signés.
