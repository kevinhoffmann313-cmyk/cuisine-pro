# Configuration de TestFlight — Cuisine Pro

Le workflow `.github/workflows/testflight.yml` prépare une version iOS signée et tente de l'envoyer à TestFlight. Il nécessite les secrets ci-dessous et une app déjà créée dans App Store Connect. Il ne publie pas automatiquement l'app sur l'App Store.

## 1. Vérifier App Store Connect

- Ouvrir https://appstoreconnect.apple.com/
- Créer l'application si elle n'existe pas : nom **Cuisine Pro**, bundle ID exact `fr.cuisinepro.app`.
- Créer une clé API App Store Connect avec les autorisations nécessaires pour gérer les builds et TestFlight. Télécharger le fichier `.p8` et le conserver en sécurité.
- Dans Certificates, Identifiers & Profiles, vérifier l'identifiant explicite `fr.cuisinepro.app`, créer un certificat **Apple Distribution** et un profil de provisionnement **App Store** associé.

## 2. Préparer le certificat

Exporter le certificat Apple Distribution avec sa clé privée au format `.p12`, puis encoder ce fichier en Base64 sur un ordinateur de confiance. Le profil App Store doit correspondre au bundle ID et au certificat. Noter le nom exact du profil.

## 3. Ajouter les secrets GitHub

Dans le dépôt : Settings → Secrets and variables → Actions → New repository secret. Ajouter :

| Nom du secret | Contenu |
|---|---|
| `APPLE_CERTIFICATE_BASE64` | Certificat de distribution `.p12` encodé en Base64 |
| `APPLE_CERTIFICATE_PASSWORD` | Mot de passe du fichier `.p12` |
| `APPLE_TEAM_ID` | Team ID Apple à 10 caractères |
| `APPLE_PROFILE_NAME` | Nom exact du profil App Store |
| `APPSTORE_ISSUER_ID` | Issuer ID de la clé API App Store Connect |
| `APPSTORE_API_KEY_ID` | Key ID de la clé API |
| `APPSTORE_API_PRIVATE_KEY` | Contenu intégral du fichier privé `.p8` |

Ne partage pas ces fichiers, mots de passe ou clés dans cette conversation. Ne les place jamais dans le code source.

## 4. Lancer le workflow

- Ouvrir https://github.com/kevinhoffmann313-cmyk/cuisine-pro/actions/workflows/testflight.yml
- Choisir « Préparer et envoyer Cuisine Pro sur TestFlight », puis **Run workflow**.
- Si une étape échoue, ouvrir les logs et corriger le secret ou le paramètre signalé.

## 5. Après l'envoi

Vérifier le build dans App Store Connect → TestFlight, compléter les informations de conformité et de test demandées par Apple, puis installer TestFlight sur l'iPhone et accepter l'invitation du testeur.

## Limites actuelles

- Le premier build peut nécessiter des ajustements de signature ou de profil.
- Ce workflow n'intègre pas les achats Premium et leur validation serveur.
- Les pages légales du dépôt sont encore des brouillons à compléter avant diffusion.
- Un build TestFlight n'est pas une publication publique dans l'App Store.
