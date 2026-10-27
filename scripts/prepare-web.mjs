import { cp, mkdir, access } from 'node:fs/promises';
import { resolve } from 'node:path';

const root = process.cwd();
const out = resolve(root, 'www');
await mkdir(out, { recursive: true });
for (const file of ['index.html', 'manifest.webmanifest', 'sw.js', 'icon.svg', 'confidentialite.html', 'conditions.html']) {
  try {
    await access(resolve(root, file));
    await cp(resolve(root, file), resolve(out, file));
  } catch (error) {
    if (error?.code !== 'ENOENT') throw error;
    if (file === 'index.html') throw new Error('index.html is required to build the mobile web bundle.');
  }
}
console.log('Cuisine Pro web bundle prepared in ./www');
