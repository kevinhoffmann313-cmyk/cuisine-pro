import { readFile } from 'node:fs/promises';
import vm from 'node:vm';

const html = await readFile(new URL('../index.html', import.meta.url), 'utf8');
const checks = [];
function check(name, condition) {
  checks.push({ name, ok: Boolean(condition) });
}
check('Document HTML en français', /<html lang="fr">/.test(html));
check('Élément principal de l’application', /id="main"/.test(html));
check('Sauvegarde locale préservée', /const KEY='cuisinePro_v1'/.test(html));
check('Stockage photos préservé', /const PHOTO_DB='cuisinePro_photos_v1'/.test(html));
check('Synchronisation Supabase présente', /createClient\(SUPABASE_URL,SUPABASE_PUBLISHABLE_KEY\)/.test(html));
check('Effacement automatique des archives désactivé', /async function purgeExpiredRecords\(\)\{\/\* Conservation volontaire/.test(html));

const inlineScripts = [...html.matchAll(/<script\b([^>]*)>([\s\S]*?)<\/script>/gi)]
  .filter(([, attrs, body]) => !/\bsrc\s*=/.test(attrs) && body.trim());
check('Scripts JavaScript intégrés présents', inlineScripts.length > 0);
for (let i = 0; i < inlineScripts.length; i++) {
  const [, , body] = inlineScripts[i];
  try {
    new vm.Script(body, { filename: `index-inline-${i + 1}.js` });
    checks.push({ name: `Syntaxe JavaScript intégrée #${i + 1}`, ok: true });
  } catch (error) {
    checks.push({ name: `Syntaxe JavaScript intégrée #${i + 1}: ${error.message}`, ok: false });
  }
}
for (const item of checks) console.log(`${item.ok ? 'OK' : 'ÉCHEC'} — ${item.name}`);
if (checks.some(item => !item.ok)) process.exitCode = 1;
else console.log(`\nContrôle réussi : ${checks.length} vérifications.`);
