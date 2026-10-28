# Google Play — fiche de préparation Cuisine Pro

Document de travail pour la fiche Google Play Console. Ne pas soumettre tant que les éléments marqués « à confirmer » ne sont pas réglés.

## Nom de l’application
Cuisine Pro

## Description courte (proposition, moins de 80 caractères)
Organisez l’hygiène, la traçabilité, les recettes et la production en cuisine.

## Description complète (proposition)
Cuisine Pro aide les professionnels de la cuisine à organiser leurs opérations quotidiennes depuis un seul outil.

**Hygiène et suivi**
- Enregistrez les relevés de température et les observations.
- Suivez les tâches du plan de nettoyage.
- Notez les actions correctives et gardez un historique.

**Traçabilité**
- Enregistrez les produits réceptionnés, fournisseurs, lots, quantités et dates limites.
- Retrouvez les informations utiles pour le suivi des produits.

**Recettes et production**
- Créez, modifiez et supprimez vos recettes personnelles.
- Renseignez les ingrédients, étapes, allergènes et notes.
- Ajustez les quantités selon le nombre de portions.
- Organisez les productions et les préparations.

**Sauvegarde**
- Exportez vos données pour conserver une copie de sécurité.
- Certaines fonctions peuvent fonctionner localement sur l’appareil. La disponibilité de la synchronisation dépend de la configuration active de votre compte.

Cuisine Pro est un outil d’organisation. Il ne remplace pas le plan de maîtrise sanitaire de votre établissement, les procédures adaptées à vos activités ni vos obligations réglementaires. Les données et relevés saisis doivent être vérifiés par l’utilisateur.

## Catégorie proposée
Professionnel / Productivité (choisir la catégorie disponible la plus pertinente dans Play Console).

## Coordonnées publiques — à confirmer avant publication
- Adresse e-mail d’assistance : À renseigner et valider par l’éditeur.
- Site Web : https://kevinhoffmann313-cmyk.github.io/cuisine-pro/
- Politique de confidentialité : https://kevinhoffmann313-cmyk.github.io/cuisine-pro/confidentialite.html
- Conditions d’utilisation : https://kevinhoffmann313-cmyk.github.io/cuisine-pro/conditions.html

## Ressources graphiques à préparer
- Icône de l’application : icône haute résolution 512 × 512 px, format PNG.
- Image de présentation : 1024 × 500 px.
- Captures d’écran réelles de l’application mobile : préparer au moins 2, idéalement 4 à 8, montrant le tableau de bord, les relevés d’hygiène, la traçabilité et les recettes.
- Les captures doivent représenter la version réellement soumise et ne pas présenter de fonctions non disponibles.

## Points bloquants avant publication
- [ ] Compléter la politique de confidentialité avec l’identité légale et les coordonnées du responsable du traitement.
- [ ] Vérifier la politique de confidentialité et les conditions sur les URL publiques.
- [ ] Mettre en place et tester la suppression de compte depuis l’application et/ou une page web si des comptes peuvent être créés.
- [ ] Remplir le formulaire « Sécurité des données » en fonction des flux réellement actifs (authentification, Supabase, données locales, photos et éventuels achats).
- [ ] Vérifier la cible Android (target API) et les exigences actuelles affichées dans Play Console.
- [ ] Vérifier les icônes natives Android, le nom de l’application, le numéro de version et le package `fr.cuisinepro.app`.
- [ ] Générer le fichier Android App Bundle (.aab) signé pour la publication.
- [ ] Effectuer les tests requis par Play Console pour ce compte et cette application.
- [ ] Ne pas annoncer l’abonnement Premium comme achetable avant que les achats intégrés et la validation des droits ne soient opérationnels.

## État technique connu au 28 octobre 2026
- Le workflow GitHub Actions a compilé avec succès un APK de test Android (artefact temporaire).
- Le bundle de publication signé n’est pas encore disponible : la clé de signature et les secrets GitHub restent à configurer.
- Le paiement Premium n’est pas encore opérationnel.
- Les documents légaux présents dans le dépôt sont des brouillons à compléter avant publication.
