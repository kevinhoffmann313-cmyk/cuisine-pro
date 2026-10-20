CUISINE PRO — PROTOTYPE 0.1

FONCTIONS
- Tableau de bord
- Registre des températures / observations / actions correctives
- Plan de nettoyage avec fréquence et validation de réalisation
- Traçabilité des réceptions : produit, fournisseur, lot, date, DLC/DDM, quantité
- Bibliothèque de recettes avec ingrédients, étapes, allergènes déclarés et notes
- Calcul de quantités à partir du nombre de portions
- Planification de productions
- Export et restauration JSON
- Stockage local dans le navigateur
- Service worker pour mise en cache de base en mode hors connexion (sur serveur HTTPS ou localhost)

OUVRIR / TESTER
Pour tester le mode hors connexion, servez ce dossier via HTTPS ou localhost (les service workers ne fonctionnent pas sur une ouverture file://). Vous pouvez utiliser un hébergement statique HTTPS. L'application n'a pas de backend.

LIMITES IMPORTANTES
- Aucune synchronisation multi-appareils n'est activée : les données restent sur le navigateur/appareil. L'export JSON permet une sauvegarde manuelle.
- Le prototype n'est pas un PMS complet validé, ni une certification de conformité HACCP. Les seuils, procédures, fréquences, responsabilités, actions correctives et durées de conservation doivent être validés et adaptés à l'établissement et à ses procédés.
- Le calcul des ingrédients est proportionnel au nombre de portions, sans calcul automatique de rendement, pertes ou conversions d'unités.
- Les allergènes sont saisis manuellement et doivent être vérifiés sur les fiches techniques et étiquettes fournisseurs.
- Pas encore de gestion utilisateurs, droits d'accès, sauvegarde serveur, journaux d'audit ou synchronisation de conflits.
