# Abonnements Cuisine Pro — intégration à terminer

## Prix et produit
- Produit mensuel à afficher : 4,99 €/mois.
- Identifiants suggérés à créer dans App Store Connect et Google Play Console : `cuisine_pro_premium_monthly` (vérifier l'identifiant exact accepté par chaque boutique).
- Un achat ne doit jamais être considéré comme valide sur la seule base du navigateur ou d'un champ `localStorage`.

## Fondations ajoutées
- `public.cuisine_pro_entitlements` : un enregistrement de droits par utilisateur.
- RLS : chaque chef connecté peut uniquement lire son propre droit Premium; les clients ne peuvent pas écrire leurs droits.
- L'application interroge cette table. En cas d'absence, d'erreur ou d'abonnement expiré, Premium reste verrouillé (fail closed).
- Le code ne comporte pas encore de validation de reçus Apple/Google ni de service serveur de renouvellement.

## Configuration Supabase
1. Exécuter `supabase/migrations/202610270001_cuisine_pro_entitlements.sql` dans l'éditeur SQL du projet Supabase.
2. Vérifier que l'utilisateur connecté peut lire sa propre ligne (une absence de ligne équivaut à Gratuit).
3. Ne jamais exposer la clé `service_role` dans `index.html`, dans GitHub Pages, dans une app mobile ou dans un dépôt.
4. Ne pas créer de ligne Premium manuellement pour un client réel : cela contournerait le contrôle d'achat.

## Travail obligatoire avant commercialisation
1. Choisir et intégrer un système de paiements natifs (par exemple RevenueCat ou un backend maison avec App Store Server API et Google Play Developer API).
2. Créer les produits/abonnements dans App Store Connect et Play Console.
3. Ajouter un backend sécurisé (Edge Functions ou service dédié) qui vérifie les reçus/transactions directement auprès d'Apple et de Google, puis met à jour la table via une clé serveur secrète.
4. Traiter renouvellement, période de grâce, remboursement, révocation, résiliation, changement de compte et restauration des achats.
5. Ajouter l'interface d'achat native et le bouton « Restaurer mes achats ».
6. Tester achats, renouvellements et résiliations dans les environnements sandbox des deux boutiques.
7. Faire appliquer le contrôle Premium côté serveur à toutes les données et opérations réellement réservées à Premium. Le verrouillage actuel dans l'interface seule n'est pas une barrière de sécurité complète.
8. Préparer politique de confidentialité, conditions d'abonnement, suppression de compte, assistance et informations fiscales.

## État honnête
Cette migration est uniquement le schéma de droits et le mécanisme de lecture côté client. Elle ne met pas en place le paiement et ne doit pas être annoncée comme un abonnement achetable. L'app ne donne pas de Premium par défaut. Les achats intégrés doivent être terminés et testés avant la soumission.
